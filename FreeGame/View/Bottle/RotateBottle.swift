//
//  RotateBottle.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import SwiftUI

struct RotateBottle: View {
    
    @State private var rotateBottleSound = "movieSong"
    @State private var selectedTask = "Generate your task from bottom buttons"
    @State private var spinningVM:RotateBottleViewModel = RotateBottleViewModel()
    @State private var circleColor: Color = AppColor.greyClr.color.opacity(0.5)
    @State private var backgroundColor: Color = AppColor.black.color
    @State private var timer: Timer?
    @State private var volume: Float = 0.5
    
    var body: some View {
        ZStack {
            backgroundColor
           
            VStack {
                Spacer()
                Text(selectedTask)
                    .font(.title)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom , 50)
                
                CircleAnimation(rotateBottleSound: rotateBottleSound)
                    .padding()
                Spacer()
                
                
                //botton action
                HStack{
                    Button(action: {
                        selectedTask = spinningVM.filterTruth()
                    }) {
                        Text("Get Truth")
                            .foregroundColor(.white)
                            .padding(.horizontal, 34)
                            .padding(.vertical,12)
                            .background(Color.pink)
                            .clipShape(.capsule)
                    }
                    .padding()
                    
                    
                    Button(action: {
                        selectedTask = spinningVM.filterDare()
                    }) {
                        Text("Get Dare")
                            .foregroundColor(.white)
                            .padding(.horizontal, 34)
                            .padding(.vertical, 12)
                            .background(Color.pink)
                            .clipShape(.capsule)
                    }
                    .padding()
                    
                }
                .padding(.bottom, 20)
               
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func filterTruth(){
        circleColor = AppColor.RandomClr.color
        selectedTask = spinningVM.filterTruth()
    }
    
    func filtreDare(){
        circleColor = AppColor.RandomClr.color
        selectedTask = spinningVM.filterDare()
    }
    
}

#Preview {
    RotateBottle()
}
