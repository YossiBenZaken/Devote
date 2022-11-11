//
//  SoundPlayer.swift
//  Devote
//
//  Created by Yosef Ben Zaken on 16/10/2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
            feedback.notificationOccurred(.success)
        } catch {
            print("Could not find and play the sound file")
        }
    }
}
