//
//  ViewController.swift
//  ClockApp
//
//  Created by Byron Bacusoy Pinela on 26/1/17.
//  Copyright © 2017 Novex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textLabel.text = ""
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
        
    }
    
    func updateClock(){
        
        let date = NSDate()
        let calendar = NSCalendar.current
        
        let components = calendar.dateComponents([.hour, .minute, .second], from: date as Date)
        
        //Como lo pondremos en modo 12h y no 24 tenemos que hacer esto
        let hour = components.hour! > 12 ? components.hour! - 12 : components.hour!
        
        let hourString = hour > 9 ? "\(hour)" : "0\(hour)"
        let minuteString = components.minute! > 9 ? "\(components.minute!)" : "0\(components.minute!)"
        let secondString = components.second! > 9 ? "\(components.second!)" : "0\(components.second!)"
        let am = components.hour! > 12 ? "PM" : "AM"
        
        let finalString = "\(hourString):\(minuteString):\(secondString) \(am)"
        
        textLabel.text = finalString
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

