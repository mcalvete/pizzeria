//
//  ResumenController.swift
//  pizzeria
//
//  Created by Martín Calvete on 24/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import WatchKit
import Foundation


class ResumenController: WKInterfaceController {

    var pizza : Pizza?
    
    @IBOutlet var sizeLabel: WKInterfaceLabel!
    @IBOutlet var breadLabel: WKInterfaceLabel!
    @IBOutlet var cheeseLabel: WKInterfaceLabel!
    @IBOutlet var ingredientsLabel: WKInterfaceLabel!
    @IBOutlet var confirm: WKInterfaceButton!
    @IBOutlet var aviso: WKInterfaceLabel!
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
        sizeLabel.setText(pizza!.tamano)
        breadLabel.setText(pizza!.masa)
        cheeseLabel.setText(pizza!.queso)
        var ingredientes : String = String("")
        for ingrediente in (self.pizza?.ingredientes)! {
            if (ingredientes.isEmpty) {
                ingredientes = ingrediente
            } else {
                ingredientes = ingredientes + "\n" + ingrediente
            }
        }
        ingredientsLabel.setText(ingredientes)

        let datosValidos = valida()
        if (datosValidos) {
            confirm.setEnabled(true)
            aviso.setText("Pizza correctamente configurada")
        } else {
            confirm.setEnabled(false)
            aviso.setText("Atención!!!\nDebe seleccionar todos los detalles")
        }
    }
    
    func valida() -> Bool {
        
        if (self.pizza?.tamano.isEmpty)! {
            return false
        }
        if (self.pizza?.masa.isEmpty)! {
            return false
        }
        if (self.pizza?.queso.isEmpty)! {
            return false
        }
        if (self.pizza?.ingredientes.isEmpty)! {
            return false
        }
        
        return true
    }

}
