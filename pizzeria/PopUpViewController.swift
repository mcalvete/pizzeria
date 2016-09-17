//
//  PopUpViewController.swift
//  pizzeria
//
//  Created by Martín Calvete on 17/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var pizza : Pizza?

    @IBOutlet weak var tamano: UILabel!
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var queso: UILabel!
    @IBOutlet weak var ingredientes: UILabel!
    @IBOutlet weak var aviso: UILabel!
    
    @IBOutlet weak var acceptButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imprimePantalla()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imprimePantalla()
    }
    
    func imprimePantalla() {
        self.tamano.text = self.pizza?.tamano
        self.masa.text = self.pizza?.masa
        self.queso.text = self.pizza?.queso
        self.ingredientes.text = ""
        for ingrediente in (self.pizza?.ingredientes)! {
            if (ingredientes.text?.isEmpty)! {
                ingredientes.text = ingrediente
            } else {
                ingredientes.text = ingredientes.text! + "\n" + ingrediente
            }
        }
        
        let datosValidos = valida()
        if (datosValidos) {
            acceptButton.isEnabled = true
            aviso.text = "Para confirmar la pizza\npulse el botón de Pedir."
        } else {
            acceptButton.isEnabled = false
            aviso.text = "Atención!!!\nDebe seleccionar todos los detalles de la pizza"
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
