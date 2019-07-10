//
//  ViewController.swift
//  SequenceGame
//
//  Created by MacStudent on 2019-07-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController , WCSessionDelegate{
    //MARKL:variables
    var arr = [String: Any]()
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    

    @IBAction func fish(_ sender: Any) {
        print("you select fish")
        self.arr["first"] = 0
        print(self.arr)
        if(arr.count == 4)
        {
            sendData()
        }
    }
    
    @IBAction func sun(_ sender: Any) {
        print("you select sun")
        self.arr["second"] = 1
        print(self.arr)
        if(arr.count == 4)
        {
            sendData()
        }
    }
    @IBAction func sunglasses(_ sender: Any) {
        print("you select sunglasses")
        self.arr["third"] = 2
        print(self.arr)
        if(arr.count == 4)
        {
            sendData()
        }
    }
    @IBAction func watermelon(_ sender: Any) {
        print("you select watermelon")
        self.arr["forth"] = 3
        print(self.arr)
        if(arr.count == 4)
        {
            sendData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (WCSession.isSupported()) {
            print("PHONE: Phone supports WatchConnectivity!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            print("PHONE: Phone does not support WatchConnectivity")
        }
       
       
    }
    func sendData()
    {
        // check if the watch is paired / accessible
        if (WCSession.default.isReachable) {
            
            
            let seq = ["sequence": arr]
            // send the message to the watch
            WCSession.default.sendMessage(seq, replyHandler: nil)
            
        }
        else {
            print("PHONE: Cannot find the watch")
        }
        
    }


}

