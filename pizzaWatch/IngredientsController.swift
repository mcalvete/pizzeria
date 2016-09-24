//
//  IngredientsController.swift
//  pizzeria
//
//  Created by Martín Calvete on 24/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import WatchKit
import Foundation


class IngredientsController: WKInterfaceController {

    var pizza : Pizza?
    
    @IBOutlet var jamon: WKInterfaceSwitch!
    @IBOutlet var pepperoni: WKInterfaceSwitch!
    @IBOutlet var pavo: WKInterfaceSwitch!
    @IBOutlet var salchicha: WKInterfaceSwitch!
    @IBOutlet var aceituna: WKInterfaceSwitch!
    @IBOutlet var cebolla: WKInterfaceSwitch!
    @IBOutlet var pimiento: WKInterfaceSwitch!
    @IBOutlet var pina: WKInterfaceSwitch!
    @IBOutlet var anchoa: WKInterfaceSwitch!
    
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
        jamon.setOn(false)
        pepperoni.setOn(false)
        pavo.setOn(false)
        salchicha.setOn(false)
        aceituna.setOn(false)
        cebolla.setOn(false)
        pimiento.setOn(false)
        pina.setOn(false)
        anchoa.setOn(false)

        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[0])) {
            jamon.setOn(true)
        }
        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[1])) {
            pepperoni.setOn(true)
        }
        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[2])) {
            pavo.setOn(true)
        }
        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[3])) {
            salchicha.setOn(true)
        }
        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[4])) {
            aceituna.setOn(true)
        }
        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[5])) {
            cebolla.setOn(true)
        }
        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[6])) {
            pimiento.setOn(true)
        }
        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[7])) {
            pina.setOn(true)
        }
        if (pizza!.ingredientes.contains(pizza!.ingredienteOptions[8])) {
            anchoa.setOn(true)
        }
    }

    @IBAction func jamonAction(_ value: Bool) {
        selecciona(i: 0, value: value, element: jamon)
    }
    @IBAction func pepperoniAction(_ value: Bool) {
        selecciona(i: 1, value: value, element: pepperoni)
    }
    @IBAction func pavoAction(_ value: Bool) {
        selecciona(i: 2, value: value, element: pavo)
    }
    @IBAction func salchichaAction(_ value: Bool) {
        selecciona(i: 3, value: value, element: salchicha)
    }
    @IBAction func aceitunaAction(_ value: Bool) {
        selecciona(i: 4, value: value, element: aceituna)
    }
    @IBAction func cebollaAction(_ value: Bool) {
        selecciona(i: 5, value: value, element: cebolla)
    }
    @IBAction func pimiento(_ value: Bool) {
        selecciona(i: 6, value: value, element: pimiento)
    }
    @IBAction func pinaAction(_ value: Bool) {
        selecciona(i: 7, value: value, element: pina)
    }
    @IBAction func anchoaAction(_ value: Bool) {
        selecciona(i: 8, value: value, element: anchoa)
    }
    
    func selecciona(i:Int, value:Bool, element:WKInterfaceSwitch!) {
        if (value) {
            if (!pizza!.ingredientes.contains(pizza!.ingredienteOptions[i])) {
                if (pizza!.ingredientes.count < 5) {
                    pizza!.ingredientes.append(pizza!.ingredienteOptions[i])
                } else {
                    element.setOn(false)
                }
            }
        } else {
            let index = pizza!.ingredientes.index(of: pizza!.ingredienteOptions[i])
            pizza!.ingredientes.remove(at: index!)
        }
    }
    
    @IBAction func next() {
        pushController(withName: "resumenController", context: pizza)
    }
}
