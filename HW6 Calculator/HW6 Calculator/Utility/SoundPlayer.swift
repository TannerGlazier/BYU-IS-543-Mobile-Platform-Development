//
//  SoundPlayer.swift
//  HW6 Calculator
//
//  Created by Tanner Glazier on 9/28/23.
//

import Foundation
import AVFoundation

struct SoundPlayer{
    var player: AVAudioPlayer?
    
    mutating func PlaySound(named soundName: String) async {
        guard let path = Bundle.main.path(forResource: soundName, ofType: nil) else{
            // if the path not found, just dont try to play it
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: URL(filePath: path))
            player?.play()
        } catch{
            // Ignore --Just don't try to play the sound
        }
        
    }
}
