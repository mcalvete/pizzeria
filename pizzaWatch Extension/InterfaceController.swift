//
//  InterfaceController.swift
//  pizzaWatch Extension
//
//  Created by Martín Calvete on 24/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var pizza : Pizza = Pizza.init(tamano:"", masa:"", queso:"", ingredientes:[])

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func comenzar() {
        pushController(withName: "sizeController", context: pizza)
    }
}
