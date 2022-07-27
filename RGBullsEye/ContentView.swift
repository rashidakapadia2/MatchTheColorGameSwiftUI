//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 27/07/22.
//

import SwiftUI

struct ContentView: View {
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        let finalVal = Int((1.0 - diff) * 100.0 + 0.5)
        if finalVal >= 97 {
            return 100
        }
        return finalVal
    }
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    
    var body: some View {
        
        VStack {
//            Button {
//                print("Button Clicked")
//            } label: {
//                Text("START A NEW GAME")
//            }

            Spacer()
            HStack {
                VStack {
                    Rectangle().foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget, opacity: 1.0))
                    Text("Match this color")
                }
                // Guess color block
                VStack {
                    Rectangle().foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess))
                    HStack {
                        Text("R: \(Int(rGuess * 255.0))")
                        Text("G: \(Int(gGuess * 255.0))")
                        Text("B: \(Int(bGuess * 255.0))")
                    }
                }
            }
            HStack {
                Text("Target Color Block")
                    .padding()
                Text("Guess Color Block")
                    .padding()
            }
            Button(action: {
                self.showAlert = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $showAlert) {
                if computeScore() == 100 {
                   return Alert(title: Text("Your Score"), message: Text("\(computeScore())/100\n CONGRATULATIONS!"))
                }
                return Alert(title: Text("Your Score"), message: Text("\(computeScore())/100"))
            }
            
            VStack {
                ColorSlider(value: $rGuess, textColor: .red)
                ColorSlider(value: $gGuess, textColor: .green)
                ColorSlider(value: $bGuess, textColor: .blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
                .foregroundColor(textColor)
        }.padding()
    }
}
