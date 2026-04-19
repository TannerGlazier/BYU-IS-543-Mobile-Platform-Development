//
//  SoundPlayer.swift
//  CalculatorUI
//
//  Created by Tanner Glazier on 9/26/23.
//

import Foundation
import AVFoundation

struct SoundPlayer{
    var player: AVAudioPlayer?
    
    mutating func PlaySound(named soundName: String){
        guard let path = Bundle.main.path(forResource: soundName, ofType: nil) else{
            // if the path not found, just dont try to play it
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: URLFile)
        }
    }
}
