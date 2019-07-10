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
    //MARK:IMAGEVIEW
    
   
   @IBOutlet weak var imageView: WKInterfaceImage!
    
  
    
 
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    var images: [UIImage]!
 
    
    var animatedImage: UIImage!
    var arr = [String: Any]()

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
     
      
        images = [ UIImage(named: "fish"), UIImage(named: "sun"),  UIImage(named: "watermelon")].shuffled() as? [UIImage]
         animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        imageView.setImage(animatedImage)
        imageView.startAnimating()
       
       
       
       
       
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
         print("WATCH: Got a message! on first screen")
        print(message["sequence"]!)
        
        
    }

}
