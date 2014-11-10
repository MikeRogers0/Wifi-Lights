//
//  LightSwitches.swift
//  Wifi Lights
//
//  Created by Mike Rogers on 02/11/2014.
//  Copyright (c) 2014 Mike Rogers. All rights reserved.
//

import Foundation
import UIKit

class LightSwitches: GCDAsyncUdpSocketDelegate {
    let error : NSError?
    var port : UInt16
    var address : String!
    var udpSocket : GCDAsyncUdpSocket!
    let commands : [String: NSData] = [
        "on": NSData(bytes: [0x22, 0x00, 0x55] as [Byte], length: 3),
        "off": NSData(bytes: [0x21, 0x00, 0x55] as [Byte], length: 3),
        "brighter": NSData(bytes: [0x23, 0x00, 0x55] as [Byte], length: 3),
        "darker": NSData(bytes: [0x24, 0x00, 0x55] as [Byte], length: 3)
    ];
    
    init(address: String?, port: UInt16){
        self.address = address;
        self.port  = port;
        self.udpSocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue());
    }
    
    func on(){
        self.udpSocket.sendData(commands["on"], toHost: address, port:port, withTimeout: -1, tag: 1);
    }
    
    func off(){
        self.udpSocket.sendData(commands["off"], toHost: address, port:port, withTimeout: -1, tag: 2);
    }
    
    @objc func brighter(){
        self.udpSocket.sendData(commands["brighter"], toHost: address, port:port, withTimeout: -1, tag: 3);
    }
    
    @objc func darker(){
        self.udpSocket.sendData(commands["darker"], toHost: address, port:port, withTimeout: -1, tag: 4);
    }
    
    func brightest(){
        var delay = 0.0
        for index in 1...6 {
            delay += 0.2
            NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: Selector("brighter"), userInfo: nil, repeats: false)
        }
    }
    
    func darkest(){
        var delay = 0.0
        for index in 1...6 {
            delay += 0.2
            NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: Selector("darker"), userInfo: nil, repeats: false)
        }
    }
}