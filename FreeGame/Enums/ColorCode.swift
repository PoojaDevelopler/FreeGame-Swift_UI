//
//  ColorCode.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import SwiftUI

enum AppColor {
    case CircleClr
    case Dice
    case RandomClr
    case greyClr
    case OffWhite // New case for off white color
    case black
    
    var color: Color {
        switch self {
        case .CircleClr:
            return Color("circle")
            
        case .RandomClr:
            // Define a list of colors
            let colors: [Color] = [.cyan, .green, .blue, .yellow, .orange, .purple, .pink]
            // Get a random color from the list
            return colors.randomElement() ?? .white // Return a random color, or default to white if the list is empty
            
        case .greyClr:
            return .gray
            
        case .Dice:
            return Color("Dice")
            
        case .OffWhite:
            // Define your off white color here
            return Color(red: 0.95, green: 0.95, blue: 0.95)
            
        case .black:
            return .black
            
            
        }
    }
}
