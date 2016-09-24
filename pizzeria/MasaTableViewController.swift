//
//  MasaTableViewController.swift
//  pizzeria
//
//  Created by Martín Calvete on 17/9/16.
//  Copyright © 2016 Martín Calvete. All rights reserved.
//

import UIKit

// protocol used for sending data back
protocol MasaUpdateProtocol: class {
    func updatePizzaInformation(pizza: Pizza)
}

class MasaTableViewController: UITableViewController, QuesoUpdateProtocol {
    var delegate : MasaUpdateProtocol?
    
    var pizza : Pizza?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVista = segue.destination as! QuesoTableViewController
        siguienteVista.delegate = self
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
        return pizza!.masaOptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel!.text = pizza!.masaOptions[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: tableView.indexPathForSelectedRow!)
        self.pizza?.masa = (cell?.textLabel!.text)!
        delegate?.updatePizzaInformation(pizza: self.pizza!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (!(self.pizza?.masa.isEmpty)!) {
            let t : String = (self.pizza?.masa)!
            var i = 0
            switch t {
            case pizza!.masaOptions[0]:
                i = 0
            case pizza!.masaOptions[1]:
                i = 1
            case pizza!.masaOptions[2]:
                i = 2
            default:
                i = 0
            }
            let indexPath : IndexPath = NSIndexPath(item: i, section: 0) as IndexPath
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.top)
        }
    }
    
    func updatePizzaInformation(pizza: Pizza) {
        self.pizza = pizza
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
