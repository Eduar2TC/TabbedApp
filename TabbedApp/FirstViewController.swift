//
//  FirstViewController.swift
//  TabbedApp
//
//  Created by Edu on 18/03/20.
//  Copyright © 2020 Edu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var fechaLabel: UILabel!
    
    func obtenerFecha(){
        let date = Date();
        let dateFormatter = DateFormatter();
        dateFormatter.dateStyle = .full;
        
        print(dateFormatter.string(from: date))
        fechaLabel.text = dateFormatter.string(from: date);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        obtenerFecha();
    }


}

