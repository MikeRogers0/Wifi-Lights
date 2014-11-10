//
//  FirstViewController.swift
//  Wifi Lights
//
//  Created by Mike Rogers on 02/11/2014.
//  Copyright (c) 2014 Mike Rogers. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    let lightSwitches = LightSwitches(address: "192.168.1.100", port: 50000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchLightsOn() {
        lightSwitches.on();
    }
    
    @IBAction func touchLightsOff() {
        lightSwitches.off();
    }

    @IBAction func touchBrightest() {
        lightSwitches.brightest();
    }
    
    @IBAction func touchDarkest() {
        lightSwitches.darkest();
    }
}

