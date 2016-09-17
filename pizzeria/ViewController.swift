//
//  ViewController.swift
//  pizzeria
//
//  Created by Martín Calvete on 17/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pizza : Pizza = Pizza.init(tamano:"", masa:"", queso:"", ingredientes:[])
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVista = segue.destination as! TamanoTableViewController
        siguienteVista.pizza = self.pizza
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

