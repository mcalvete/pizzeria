//
//  Pizza.swift
//  pizzeria
//
//  Created by Martín Calvete on 17/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

class Pizza {
    var tamanoOptions : [String] = ["Pequeña", "Mediana", "Grande"]
    var masaOptions : [String] = ["Delgada", "Crujiente", "Gruesa"]
    var quesoOptions : [String] = ["Mozzarella", "Cheddar", "Sin queso"]
    var ingredienteOptions : [String] = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    
    var tamano : String = ""
    var masa : String = ""
    var queso : String = ""
    var ingredientes : [String] = []
    
    init(tamano:String, masa:String, queso:String, ingredientes:[String]) {
        self.tamano = tamano
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
    }
}
