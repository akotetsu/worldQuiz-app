//
//  SoundPlayer.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/23.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let correctData = NSDataAsset(name: "Quiz-Correct_Answer01-1")!.data
    var correctPlayer: AVAudioPlayer!
    
    let wrongData = NSDataAsset(name: "Quiz-Wrong_Buzzer02-1")!.data
    var wrongPlayer: AVAudioPlayer!
    
    func correctPlay() {
        do {
            correctPlayer = try AVAudioPlayer(data: correctData)
            
            correctPlayer.play()
        } catch {
            print("エラーが発生しました.")
        }
    }
    
    func wrongPlay() {
        do {
            wrongPlayer = try AVAudioPlayer(data: wrongData)
            
            wrongPlayer.play()
        } catch {
            print("エラーが発生しました.")
        }
    }

}
