//
//  RotateBottleViewModel.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import Foundation
import SwiftUI

class RotateBottleViewModel: ObservableObject {
    
    @State private var taskTrue  =  ["Have you ever cheated on a test?",
                                     "What is the most embarrassing thing you've ever done in public?",
                                     "Have you ever lied to your best friend?",
                                     "What is your biggest fear?",
                                     "What is your most embarrassing childhood memory?",
                                     "Have you ever stolen something?",
                                     "What is your guilty pleasure?",
                                     "Have you ever been in love?",
                                     "What is your biggest regret?",
                                     "What is the weirdest dream you've ever had?"]
    @State private var taskDare  =  [
        "Do your best impression of a celebrity.",
        "Go outside and dance for one minute.",
        "Call a random number and sing 'Happy Birthday' to whoever answers.",
        "Let someone else style your hair however they want.",
        "Text your crush and confess your feelings.",
        "Do 20 push-ups.",
        "Eat a spoonful of hot sauce.",
        "Post an embarrassing photo of yourself on social media.",
        "Do a handstand for 30 seconds.",
        "Speak in an accent for the next three rounds."
    ]
    
  

    // Define your methods
    func filterTruth() -> String{
        let index = Int.random(in: 0..<taskTrue.count)
        return  taskTrue[index]
    }

    func filterDare()  -> String{
        let index = Int.random(in: 0..<taskDare.count)
        return taskDare[index]
    }

    func randomColorUpdate() -> Color {
        return  AppColor.RandomClr.color
    }
}
