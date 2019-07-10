//
//  ModeInterfaceController.swift
//  SequenceGame WatchKit Extension
//
//  Created by MacStudent on 2019-07-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation


class ModeInterfaceController: WKInterfaceController {

    @IBOutlet weak var NameLabel: WKInterfaceLabel!
    @IBAction func easyBtnPressed() {
       
                UserDefaults.standard.set("Easy", forKey: "mode")
        
            
            self.pushController(withName: "mySegue1", context: nil)
       
    }
    @IBAction func hardBtnPressed() {
       
               
                UserDefaults.standard.set("Hard", forKey: "mode")
        
            self.pushController(withName: "mySegue1", context: nil)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NameLabel.setText(UserDefaults.standard.string(forKey: "name"))
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
