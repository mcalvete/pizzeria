//
//  Pizza.swift
//  pizzeria
//
//  Created by Martín Calvete on 17/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

class Pizza {
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
