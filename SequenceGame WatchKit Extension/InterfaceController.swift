//
//  InterfaceController.swift
//  SequenceGame WatchKit Extension
//
//  Created by MacStudent on 2019-07-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    var images: [UIImage]!
 
    
    var animatedImage: UIImage!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if (WCSession.isSupported()) {
            print("Watch: Phone supports WatchConnectivity!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            print("Watch: Phone does not support WatchConnectivity")
        }
//        loading_1 = UIImage(named: "fish")
//        loading_2 = UIImage(named: "sun")
//        loading_3 = UIImage(named: "sunglasses")
//
////        images = [loading_1!, loading_2!, loading_3!]
//
//        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
       
        //ImageView.image = animatedImage
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
         print("WATCH: Got a message! on first screen")
        print(message)
    }

}
