//
//  LightSwitches.swift
//  Wifi Lights
//
//  Created by Mike Rogers on 02/11/2014.
//  Copyright (c) 2014 Mike Rogers. All rights reserved.
//

import Foundation
import UIKit

class LightSwitches: GCDAsyncUdpSocketDelegate{
    let error : NSError?
    var port : UInt16
    var address : String?
    var udpSocket : GCDAsyncUdpSocket?
    
    init(address: String?, port: UInt16){
        self.address = address;
        self.port  = port;
    }
    
    func lightsOn(){
        var udpSocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue());
      
        var lightsOnCommand  =  "teststring".dataUsingEncoding(NSUTF8StringEncoding)
        
        println("Turning on lights")
        
        udpSocket.sendData(lightsOnCommand, toHost: address, port:port, withTimeout: -1, tag: 1)
    }
    
    func udpSocket(sock : GCDAsyncUdpSocket!, didReceiveData data : NSData!,  fromAddress address : NSData!,  withFilterContext filterContext : AnyObject!) {
        println(data)
    }
    
   

}