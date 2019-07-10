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
    
    var arrImages : [Int] = [ 0, 1, 2, 3]
   @IBOutlet weak var imageView: WKInterfaceImage!
    
  
    @IBOutlet weak var imageView2: WKInterfaceImage!
    
    
    @IBOutlet weak var imageView3: WKInterfaceImage!
    
    @IBOutlet weak var imageView4: WKInterfaceImage!
    
    @IBOutlet weak var WinLoseLabel: WKInterfaceLabel!
    @IBAction func btnPlayAgain() {
        print("Watch button pressed")
        self.WinLoseLabel.setHidden(true)
        imageView.setImageNamed("\(arrImages[0])")
        imageView2.setImageNamed("\(arrImages[1])")
        imageView3.setImageNamed("\(arrImages[2])")
        imageView4.setImageNamed("\(arrImages[3])")
        hideImages()
        
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    var images = [Int]()
 
    
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
        images = self.arrImages
        print(images)
        self.WinLoseLabel.setHidden(true)
        imageView.setImageNamed("\(arrImages[0])")
        imageView2.setImageNamed("\(arrImages[1])")
        imageView3.setImageNamed("\(arrImages[2])")
        imageView4.setImageNamed("\(arrImages[3])")
        
        // Easy Hard Mode
        
        hideImages()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
         print("WATCH: Got a message! on second screen")
       // print(message["sequence"])
        
        var playerSequence:[Int] = message["sequence"] as! [Int]
        
        print(playerSequence)
        
        if(playerSequence[0] == images[0] && playerSequence[1] == images[1] && playerSequence[2] == images[2] && playerSequence[3] == images[3])
        {
            print("player  selection is correct! You Win")
            self.WinLoseLabel.setHidden(false)
            self.WinLoseLabel.setText("You Win")
        }
        else{
            print("oops1 You Lose")
            self.WinLoseLabel.setHidden(false)
            self.WinLoseLabel.setText("You Lose")
        }
        
        
    }
    func hideImages()
    {
        let mode = UserDefaults.standard.string(forKey: "mode")
        if(mode == "Easy")
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                self.imageView.setImageNamed(nil)
                self.imageView2.setImageNamed(nil)
                self.imageView3.setImageNamed(nil)
                self.imageView4.setImageNamed(nil)
            }
        }
        if(mode == "Hard")
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.imageView.setImageNamed(nil)
                self.imageView2.setImageNamed(nil)
                self.imageView3.setImageNamed(nil)
                self.imageView4.setImageNamed(nil)
            }
        }

    }
   

}
