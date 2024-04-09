//
//  CustomDiceView.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import SwiftUI

struct CustomDiceView: View {
    @State private var diceRoll: Int = 1
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: 100, height: 100)
                    .shadow(radius: 5)
                
                ForEach(0..<diceRoll, id: \.self) { index in
                    
                    let angle = Double(index) * (360.0 / 6.0) // Calculate angle for each circle
                    let radians = angle * .pi / 180 // Convert angle to radians
                    let radius = 35 // Radius of the circle
                    
                    let x = 50 + radius * Int(cos(radians)) // Calculate x position
                    let y = 50 + radius * Int(sin(radians)) // Calculate y position
                    
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
//                        .offset(x: x, y: y) 
                    
//                        .position(x: x, y: y)
                    
                    
                    
                        //.fill(Color.red)
//                        .frame(width: 10, height: 10)
//                        .padding(5)
                    
                }
                
            }
            .padding()
            .rotationEffect(.degrees(Double(diceRoll) * 360)) // Rotate the dice icon based on the roll
            
            Button(action: {
                rollDice()
            }) {
                Text("Roll Dice")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func rollDice() {
        withAnimation {
            diceRoll = Int.random(in: 1...6)
        }
    }
}

#Preview {
    CustomDiceView()
}
