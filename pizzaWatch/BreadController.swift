//
//  BreadController.swift
//  pizzeria
//
//  Created by Martín Calvete on 24/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import WatchKit
import Foundation


class BreadController: WKInterfaceController {

    var pizza : Pizza?
    
    @IBOutlet var fina: WKInterfaceSwitch!
    @IBOutlet var crujiente: WKInterfaceSwitch!
    @IBOutlet var gruesa: WKInterfaceSwitch!
    
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
        fina.setOn(false)
        crujiente.setOn(false)
        gruesa.setOn(false)
        if (pizza!.masa == pizza!.masaOptions[0]) {
            fina.setOn(true)
        }
        if (pizza!.masa == pizza!.masaOptions[1]) {
            crujiente.setOn(true)
        }
        if (pizza!.masa == pizza!.masaOptions[2]) {
            gruesa.setOn(true)
        }
    }
    
    @IBAction func finaAction(_ value: Bool) {
        if (value) {
            crujiente.setOn(false)
            gruesa.setOn(false)
            pizza!.masa = pizza!.masaOptions[0]
        } else {
            pizza!.masa = ""
        }
    }
    @IBAction func crujienteAction(_ value: Bool) {
        if (value) {
            fina.setOn(false)
            gruesa.setOn(false)
            pizza!.masa = pizza!.masaOptions[1]
        } else {
            pizza!.masa = ""
        }
    }
    @IBAction func gruesaAction(_ value: Bool) {
        if (value) {
            crujiente.setOn(false)
            fina.setOn(false)
            pizza!.masa = pizza!.masaOptions[2]
        } else {
            pizza!.masa = ""
        }
    }
    @IBAction func next() {
        pushController(withName: "cheeseController", context: pizza)
    }


}
