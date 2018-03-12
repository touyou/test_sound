//
//  ViewController.swift
//  Test_Audio
//
//  Created by Wataru Inoue on 2018/03/10.
//  Copyright © 2018年 Wataru Inoue. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // mp3音声(SOUND.mp3)の再生
        playSound(name: "SOUND_NAME.mp3")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {
        let soundPath = name.split(separator: ".").map { String($0) }
        if !isValidSoundPath(soundPath) {
            print("音源ファイル名が無効です。")
            return
        }
        
        guard let path = Bundle.main.path(forResource: soundPath[0], ofType: soundPath[1]) else {
            print("音源ファイルが見つかりません")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self
            
            // 音声の再生
            audioPlayer.play()
        } catch {
        }
    }
    
    func isValidSoundPath(_ soundPath: [String]) -> Bool {
        // ここは目的とか状況によって柔軟に。
        // たとえば拡張子によって判定するとか
        return soundPath.count == 2
    }
}
