//
//  DiceView.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import SwiftUI
import AVFoundation


struct DiceView: View {
    
    @State private var diceRoll: Int = 1
    @State private var diceRollSoundID: SystemSoundID = 0
    
    var body: some View {
        
        VStack {
            
            Image("D\(diceRoll)")
                
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(Double(diceRoll) * 360)) // Rotate the dice icon based on the roll
            
                .animation(.interpolatingSpring(stiffness: 300, damping: 10)) // Add bouncy animation
                .onTapGesture {
                    rollDice()
                }
            
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
        .onAppear {
            // Load dice roll system sound
            if let soundURL = Bundle.main.url(forResource: "diceRollSound", withExtension: "mp3") {
                AudioServicesCreateSystemSoundID(soundURL as CFURL, &diceRollSoundID)
            }
        }
    }
    
    func rollDice() {
        // Play dice roll system sound
        AudioServicesPlaySystemSound(diceRollSoundID)
        
        // Generate a random dice roll between 1 and 6
        withAnimation {
            let randomNo = Int.random(in: 1...8)
            print(randomNo)
            diceRoll = randomNo > 6 ? 6 : randomNo
        }
    }
}

#Preview {
    DiceView()
}
