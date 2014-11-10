//
//  SecondViewController.swift
//  Wifi Lights
//
//  Created by Mike Rogers on 02/11/2014.
//  Copyright (c) 2014 Mike Rogers. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var tblEvents: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadTblEvents:", name:"load", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //override func viewWillAppear(animated: Bool) {
    //    tblEvents.reloadData();
    //}
    
    func reloadTblEvents(notification: NSNotification){
        tblEvents.reloadData();
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventMgr.events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test");
        cell.textLabel.text = eventMgr.events[indexPath.row].task
        cell.detailTextLabel?.text = eventMgr.events[indexPath.row].displayDate()
        return cell;
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            eventMgr.events.removeAtIndex(indexPath.row);
            tblEvents.reloadData();
        }
    }
}