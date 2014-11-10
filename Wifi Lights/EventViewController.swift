//
//  EventViewController.swift
//  Wifi Lights
//
//  Created by Mike Rogers on 02/11/2014.
//  Copyright (c) 2014 Mike Rogers. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var event: UIPickerView!
    
    let eventData = ["Wake Up", "Turn Off"];
    let eventLabel = UILabel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchedSave() {
        eventMgr.addEvent(date.date, task: eventData[event.selectedRowInComponent(0)])
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension EventViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    //UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return eventData.count;
    }
    
    // UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return eventData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        eventLabel.text = eventData[row]
    }
}