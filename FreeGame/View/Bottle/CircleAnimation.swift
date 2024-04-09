//
//  CircleAnimation.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import SwiftUI

struct CircleAnimation: View {
    
    @State private var rotationAngle: Double = 0
    @State private var arrowAngle: Double = 0
    @State private var spinningVM:RotateBottleViewModel = RotateBottleViewModel()
    @State var rotateBottleSound = "oggy"
    @State private var timerForRotation: Double = 4
    @State private var circleColor: Color = AppColor.CircleClr.color.opacity(0.5)
    @State private var timer: Timer?
    
    @State private var isSpinning: Bool = false {
        didSet {
            if !isSpinning {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+timerForRotation, execute: {
                    pauseMusic()
                })
            }
        }
    }
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(circleColor)
                .shadow(color: .gray, radius: 15)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotationAngle))
                .gesture(
                    TapGesture()
                        .onEnded {
                            spinAction()
                        }
                )
            
                .animation(.easeInOut(duration: 0.5))
            
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 5, height: 50)
                .rotationEffect(.degrees(arrowAngle))
                .offset(y: 0)
        }
    }
    
    
    func spinAction(){
        let targetAngle = Double.random(in: 0..<360)
        rotationAngle = targetAngle
        arrowAngle = targetAngle
        playMusic()
        startAnimatingArrow()
    
    }
    
    func startAnimatingArrow() {
        isSpinning = true
        var duration = 1.0 // Initial duration
        circleColorUdpate()
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation(.linear(duration: duration)) {
                self.arrowAngle += 360
            }
            duration *= 1.1 // Increase duration linearly (adjust the factor as needed)
            if duration > 3.0 { // Maximum duration (adjust as needed)
                timer.invalidate() // Stop the timer
                self.isSpinning = false

            }
        }
    }

    
    func playMusic(){
        AudioManager.shared.playSound(named: rotateBottleSound)
    }
    
    func pauseMusic(){
        AudioManager.shared.stopSound()
    }
    
    
    
    func circleColorUdpate(){
        circleColor = AppColor.RandomClr.color
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            // Check if spinner is true
            if isSpinning {
                circleColor = spinningVM.randomColorUpdate()
            } else {
                timer?.invalidate()
                timer = nil
            }
        }
    }
}

#Preview {
    CircleAnimation()
}
