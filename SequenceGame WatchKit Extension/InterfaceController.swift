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
    
    var arrImages : [Int] = [ 0, 1, 1, 3]
   @IBOutlet weak var imageView: WKInterfaceImage!
    
  
    @IBOutlet weak var imageView2: WKInterfaceImage!
    
    
    @IBOutlet weak var imageView3: WKInterfaceImage!
    
    @IBOutlet weak var imageView4: WKInterfaceImage!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    var images = [String: Any]()
 
    
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
     
      
//        images = [ UIImage(named: "fish"), UIImage(named: "sun"),  UIImage(named: "watermelon"),  UIImage(named: "sunglasses") ].shuffled() as? [UIImage]
//         animatedImage = UIImage.animatedImage(with: images, duration: 2.0)
//        imageView.setImage(animatedImage)
//        print(animatedImage.pngData())
//        //imageView.startAnimating()
         self.arrImages.shuffle()
        print(self.arrImages.shuffle())
        images["first"] = arrImages[0]
        images["second"] = arrImages[1]
        images["third"] = arrImages[2]
        images["forth"] = arrImages[3]
        print(images)
        imageView.setImageNamed("\(arrImages[0])")
        imageView2.setImageNamed("\(arrImages[1])")
        imageView3.setImageNamed("\(arrImages[2])")
        imageView4.setImageNamed("\(arrImages[3])")
        
        
       
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
