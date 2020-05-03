//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes: [String: Int] = ["Soft": 3, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPast = 0
    var timer = Timer()
    var player = AVAudioPlayer()
    let path = Bundle.main.path(forResource: "alarm_sound", ofType : "mp3")!
    
    func playSound() {
        let url = URL(fileURLWithPath : self.path)
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            self.player.play()
        } catch {
            print ("There is an issue with this code!")
        }
    }

    @IBAction func handleEggPress(_ sender: UIButton) {
        
        guard let selectedHardness = sender.currentTitle  else { return }
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPast = 0
        totalTime = eggTimes[selectedHardness]!
        titleLabel.text = selectedHardness.uppercased()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.totalTime > self.secondsPast {
                self.secondsPast += 1
                let progress: Float = Float(self.secondsPast) / Float(self.totalTime)
                self.progressBar.progress = progress
                print("progress: \(progress) \(self.secondsPast) \(self.totalTime)")
            } else {
                self.titleLabel.text = "Your eggs is ready! Bon appetit!"
                self.timer.invalidate()
                
                self.playSound()
            }
        }
    }
}
