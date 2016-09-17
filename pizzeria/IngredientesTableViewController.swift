//
//  IngredientesTableViewController.swift
//  pizzeria
//
//  Created by Martín Calvete on 17/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import UIKit

// protocol used for sending data back
protocol IngredientesUpdateProtocol: class {
    func updatePizzaInformation(pizza: Pizza)
}

class IngredientesTableViewController: UITableViewController {
    var delegate : IngredientesUpdateProtocol?
    
    var pizza : Pizza?
    
    var ingredientes : [String] = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVista = segue.destination as! PopUpViewController
        siguienteVista.pizza = self.pizza
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if (tableView.indexPathsForSelectedRows?.count == 5) {
            return nil
        }
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexCells : [IndexPath] = tableView.indexPathsForSelectedRows!
        self.pizza?.ingredientes.removeAll()
        for indexCell in indexCells {
            let cell = tableView.cellForRow(at: indexCell)
            self.pizza?.ingredientes.append((cell?.textLabel!.text)!)
        }
        delegate?.updatePizzaInformation(pizza: self.pizza!)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.pizza?.ingredientes.removeAll()
        if (tableView.indexPathsForSelectedRows != nil) {
            let indexCells : [IndexPath] = tableView.indexPathsForSelectedRows!
            
            for indexCell in indexCells {
                let cell = tableView.cellForRow(at: indexCell)
                self.pizza?.ingredientes.append((cell?.textLabel!.text)!)
            }
        }
        
        delegate?.updatePizzaInformation(pizza: self.pizza!)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel!.text = ingredientes[indexPath.row]
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (!(self.pizza?.ingredientes.isEmpty)!) {
            let t : [String] = (self.pizza?.ingredientes)!
            for i in 0..<ingredientes.count {
                if (t.contains(ingredientes[i])) {
                let indexPath : IndexPath = NSIndexPath(item: i, section: 0) as IndexPath
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.top)
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
