//
//  SecondViewController.swift
//  TabbedApp
//
//  Created by Edu on 18/03/20.
//  Copyright © 2020 Edu. All rights reserved.
//

import UIKit
import AVFoundation  //Sound

class SecondViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    private var dateAlarm: String = "";
    private var timer = Timer(); //Timer
    private var audioPlayer: AVAudioPlayer!; //variable sound
    
    private func createScheduleTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTimeAlarm) , userInfo: nil, repeats: true)
    }
    
    @objc func currentTimeAlarm() {
        //format timer
        let formatter = DateFormatter();
        formatter.dateFormat = "MM/dd/yy, hh:mm a";
        
        self.dateAlarm = formatter.string(from: Date());
        print(self.dateAlarm)
        //call function of comparation
        self.initAlarm();
    }
    //get time picker
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy, hh:mm a";
        /*formating date*/
        //dateFormatter.dateStyle = .short
        //dateFormatter.timeStyle = .short
        
        let strDate = dateFormatter.string(from: datePicker.date)
        //update label date
        dateLabel.text = strDate
        //init scheduler timer
        self.createScheduleTimer();
        
    }
    //comparation betwen dates
    func compareDateTime()-> Bool{
        if((self.dateLabel!.text != nil && self.dateAlarm != "") && self.dateLabel!.text == self.dateAlarm ){
            return true
        }
        else {
            return false
        }
        return false
    }
    func initSoundAlert(){ //tipo de sonido
        let sound = Bundle.main.path(forResource: "01 Cyka Blyat - Radio Edit", ofType: "mp3"); //file mp3
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!));
            audioPlayer.play();
        }catch{
            print(error);
        }
    }
    func stopAlert(){
        self.audioPlayer.stop();
    }
    func alertMessage(){
        let alert = UIAlertController(title: "Alarma", message: "¿Detener Alarma?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Si", style: .default, handler: { action in
            self.stopAlert()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    func initAlarm(){
        var centinela: Bool = false;
        centinela = self.compareDateTime();
        if(centinela == true){
            print(centinela);
            self.timer.invalidate();
            self.initSoundAlert();
            self.alertMessage();
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

