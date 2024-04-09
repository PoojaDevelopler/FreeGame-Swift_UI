//
//  AudioManager.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import Foundation
import AVFoundation



class AudioManager {
    static let shared = AudioManager() // Singleton instance
    
    var audioPlayer: AVAudioPlayer?
    var isPlaying: Bool {
        return audioPlayer?.isPlaying ?? false
    }
    var playbackPosition: TimeInterval = 0
    
    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            if audioPlayer == nil || !isPlaying {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.currentTime = playbackPosition
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } else {
                print("Sound is already playing")
            }
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        if let player = audioPlayer {
            playbackPosition = player.currentTime
            player.stop()
        }
    }
}
