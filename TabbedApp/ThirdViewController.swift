//
//  ThirdViewController.swift
//  TabbedApp
//
//  Created by Edu on 19/03/20.
//  Copyright © 2020 Edu. All rights reserved.
//

import UIKit
class ThirdViewController: UIViewController {
    //atributes
    private var counterSeconds = 0
    private var minutes = 0;
    private var hours = 0;
    private var timer = Timer();
    private var isPlaying = false
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func startTimer(_ sender: Any) {
        if(self.isPlaying) {
            return
        }
        self.startButton.isEnabled = false
        self.pauseButton.isEnabled = true
            
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        self.isPlaying = true
    }
    @IBAction func pauseTimer(_ sender: Any) {
        self.startButton.isEnabled = true
        self.pauseButton.isEnabled = false
            
        self.timer.invalidate()
        self.isPlaying = false
    }
    @IBAction func resetTimer(_ sender: Any) {
        self.startButton.isEnabled = true
        self.pauseButton.isEnabled = false
            
        self.timer.invalidate()
        self.isPlaying = false;
        self.counterSeconds = 0;
        self.minutes = 0;
        self.hours = 0;
        self.timeLabel.text = String("\(String(format: "%02d", self.hours)):\(String(format: "%02d", self.minutes)):\(String(format: "%02d", self.counterSeconds))");
        
    }
    func iniElementsTimer(){
        let seconds : String = String(format: "%02d", self.counterSeconds);
        let minutes : String = String(format: "%02d", self.minutes);
        let hours : String = String(format: "%02d", self.hours);
        self.timeLabel.text = String("\(hours):\(minutes):\(seconds)")

        self.pauseButton.isEnabled = false
    }
    @objc func UpdateTimer() {
        
        counterSeconds = counterSeconds + 1
        if(self.counterSeconds == 60){
            self.minutes = self.minutes + 1;
            self.counterSeconds = 0;
        }
        else if(self.minutes == 60){
            self.hours = self.hours + 1;
            self.minutes = 0;
        }
        else if(self.hours == 99){
            self.counterSeconds = 0;
            self.minutes = 0;
            self.hours = 0;
        }
        //update label
        self.timeLabel.text = String("\(String(format: "%02d", self.hours)):\(String(format: "%02d", self.minutes)):\(String(format: "%02d", self.counterSeconds))");
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        iniElementsTimer(); // init labelUI
        // Do any additional setup after loading the view.
        
    }


}

