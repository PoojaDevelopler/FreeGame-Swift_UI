//
//  PlayBackgroundMusic.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import SwiftUI
import AVFoundation

struct PlayBackgroundMusic: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var waveColors: [Color] = Array(repeating: .blue, count: 100) // Initial colors
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            HStack(spacing: 1) {
                ForEach(waveColors, id: \.self) { color in
                    Rectangle()
                        .fill(color)
                        .frame(width: 2, height: CGFloat.random(in: 50...100))
                }
            }
        }
        .onAppear {
            playMusic()
            startUpdatingWaveColors()
        }
        .onDisappear {
            stopUpdatingWaveColors()
            audioPlayer?.stop()
        }
    }
    
    func playMusic() {
        guard let path = Bundle.main.path(forResource: "movieSong", ofType: "mp3") else {
            print("Music file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error playing music: \(error.localizedDescription)")
        }
    }
    
    func startUpdatingWaveColors() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if let player = audioPlayer {
                let waveColors = computeWaveColors(audioPlayer: player)
                self.waveColors = waveColors
            }
        }
    }
    
    func stopUpdatingWaveColors() {
        timer?.invalidate()
        timer = nil
    }
    
    func computeWaveColors(audioPlayer: AVAudioPlayer) -> [Color] {
        // Perform FFT analysis and compute intensity values for frequency bands
        
        // Example: Simulated intensity values
        let intensityValues = (0..<500).map { _ in CGFloat.random(in: 0...1) }
        
        // Map intensity values to colors
        let colors = intensityValues.map { intensity in
            Color(red: intensity, green: 0, blue: 1 - intensity).opacity(0.5)
        }
        
        return colors
    }
}

#Preview {
    PlayBackgroundMusic()
}
