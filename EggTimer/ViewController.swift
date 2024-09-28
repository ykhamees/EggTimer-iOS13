//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    let egTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var originalTime: Int = 0
    var secondsPassed: Int = 0
    var timer = Timer()
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle != nil ? sender.currentTitle! : ""
        let time : Int = egTimes[hardness] != nil ? egTimes[hardness]! : 0
        
        timer.invalidate()
        
        originalTime = time * 60
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTime), userInfo: nil, repeats: true)
//        Timer.scheduledTimer(withTimeInterval:1.0, repeats:true){
//            timer in if timeInSeconds > 0 {
//                print("\(timeInSeconds) seconds remaining")
//                timeInSeconds -= 1
//            } else {
//                print("Countdown Finished")
//            }
//        }
    }
    
    @objc func updateTime() {
        if(secondsPassed < originalTime){
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(originalTime)
        } else {
            titleLabel.text = "Done!"
            print("Countdown Finished")
        }
    }
    

}
