//
//  ViewController.swift
//  autoLayout Practice
//
//  Created by Alex Weimers on 2019-04-14.
//  Copyright © 2019 Alex Weimers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var time = 0
    var timerStatus = false
    
    
    @IBOutlet weak var timerDisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func processTimer() {
        
        time += 1
        
        timerString(time: time)
    }
    
    func timerString(time: Int) {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        timerDisplay.text =  String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        
    }

    @IBAction func startTimer(_ sender: UIButton) {
        
        if timerStatus == false {
            timerStatus = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
        } else {
            timerStatus = false
            timer.invalidate()
        }
    }
    
    @IBAction func add10Secs(_ sender: UIButton) {
        
        time += 10
        
        timerString(time: time)
    }
    
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
        time = 0
        
        timerString(time: time)
        
        timer.invalidate()
        
        timerStatus = false
    }
    
}

