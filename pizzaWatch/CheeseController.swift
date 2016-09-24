//
//  CheeseController.swift
//  pizzeria
//
//  Created by Martín Calvete on 24/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import WatchKit
import Foundation


class CheeseController: WKInterfaceController {

    var pizza : Pizza?
    
    @IBOutlet var mozarella: WKInterfaceSwitch!
    @IBOutlet var cheddar: WKInterfaceSwitch!
    @IBOutlet var sinQueso: WKInterfaceSwitch!
    
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
        mozarella.setOn(false)
        cheddar.setOn(false)
        sinQueso.setOn(false)
        if (pizza!.queso == pizza!.quesoOptions[0]) {
            mozarella.setOn(true)
        }
        if (pizza!.queso == pizza!.quesoOptions[1]) {
            cheddar.setOn(true)
        }
        if (pizza!.queso == pizza!.quesoOptions[2]) {
            sinQueso.setOn(true)
        }
    }
    @IBAction func mozarellaAction(_ value: Bool) {
        if (value) {
            cheddar.setOn(false)
            sinQueso.setOn(false)
            pizza!.queso = pizza!.quesoOptions[0]
        } else {
            pizza!.queso = ""
        }
    }
    @IBAction func cheddarAction(_ value: Bool) {
        if (value) {
            mozarella.setOn(false)
            sinQueso.setOn(false)
            pizza!.queso = pizza!.quesoOptions[1]
        } else {
            pizza!.queso = ""
        }
    }
    @IBAction func sinQuesoAction(_ value: Bool) {
        if (value) {
            mozarella.setOn(false)
            cheddar.setOn(false)
            pizza!.queso = pizza!.quesoOptions[2]
        } else {
            pizza!.queso = ""
        }
    }
    @IBAction func next() {
        pushController(withName: "ingredientsController", context: pizza)
    }

}
