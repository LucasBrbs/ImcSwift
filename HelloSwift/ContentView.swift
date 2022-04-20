//
//  ContentView.swift
//  HelloSwift
//
//  Created by Lucas Barbosa de Oliveira on 19/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Height: String = ""
    @State private var Weight: String = ""
    @State private var Imc: Double = 0
    @State private var resposta: String = ""
    
    var body: some View {
        VStack{
            Text("IMC").font(.largeTitle)
            
            TextField("Height", text: $Height).textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            
            TextField("Weight", text: $Weight).textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            Button{
                let weight = Double(self.Weight)!
                let height = Double(self.Height)!
                self.Imc = weight/(height * height)
                if self.Imc < 18.5 {
                    self.resposta = "abaixo do peso"
                }
                else if self.Imc < 24.9 {
                    self.resposta = "peso ideal"
                }
                else if self.Imc < 29.9 {
                    self.resposta = "acima do peso"
                }
                else{
                    self.resposta = "obeso"
                }
            } label: {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
            
            Text("IMC = \(Imc)")
            
            Text("IMC \(Imc, specifier: "%.1f"),\(resposta)").font(.title).padding()
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
