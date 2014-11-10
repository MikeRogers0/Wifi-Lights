//
//  EventManager.swift
//  Wifi Lights
//
//  Created by Mike Rogers on 10/11/2014.
//  Copyright (c) 2014 Mike Rogers. All rights reserved.
//

import UIKit

struct event {
    var date = NSDate()
    var task = "Wake Up"
    
    
    func displayDate() -> String {
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.stringFromDate(date)
    }
}

var eventMgr : EventManager = EventManager()

class EventManager: NSObject {
    var events = [event()]
    
    func addEvent(date: NSDate, task: String){
        events.append(event(date: date, task: task))
    }
}
