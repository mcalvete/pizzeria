//
//  SizeController.swift
//  pizzeria
//
//  Created by Martín Calvete on 24/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import WatchKit
import Foundation


class SizeController: WKInterfaceController {
    
    var pizza : Pizza?
    
    @IBOutlet var small: WKInterfaceSwitch!
    @IBOutlet var medium: WKInterfaceSwitch!
    @IBOutlet var big: WKInterfaceSwitch!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let c = context as! Pizza
        pizza = c
        loadData()
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
    
    func loadData() {
        small.setOn(false)
        medium.setOn(false)
        big.setOn(false)
        if (pizza!.tamano == pizza!.tamanoOptions[0]) {
            small.setOn(true)
        }
        if (pizza!.tamano == pizza!.tamanoOptions[1]) {
            medium.setOn(true)
        }
        if (pizza!.tamano == pizza!.tamanoOptions[2]) {
            big.setOn(true)
        }
    }
    
    @IBAction func smallAction(_ value: Bool) {
        if (value) {
            medium.setOn(false)
            big.setOn(false)
            pizza!.tamano = pizza!.tamanoOptions[0]
        } else {
            pizza!.tamano = ""
        }
    }
    
    @IBAction func mediumAction(_ value: Bool) {
        if (value) {
            small.setOn(false)
            big.setOn(false)
            pizza!.tamano = pizza!.tamanoOptions[1]
        } else {
            pizza!.tamano = ""
        }
    }
    
    @IBAction func bigAction(_ value: Bool) {
        if (value) {
            small.setOn(false)
            medium.setOn(false)
            pizza!.tamano = pizza!.tamanoOptions[2]
        } else {
            pizza!.tamano = ""
        }
    }

    @IBAction func next() {
        pushController(withName: "breadController", context: pizza)
    }
}
