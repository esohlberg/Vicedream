//
//  SpendViceTableViewController.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/21/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import UIKit

extension SpendViceTableViewController: FinalSpendViceViewControllerDelegate {
    func saveHistory(_ history: History) {
        historyManager.addHistory(history)
    }
}

class SpendViceTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func backOut(_ sender: Any) {
        if presentingViewController != nil {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
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
        return viceManager.vicedreamsCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vicedreamCell", for: indexPath)
        let vice = viceManager.getVicedream(at: indexPath.row)
        cell.textLabel?.text = vice.name
        cell.detailTextLabel?.text = String(vice.rate) + (vice.hourly ? "/hour" : "")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow,
            let finalspendviceViewController = segue.destination
                as? FinalSpendViceViewController {
            finalspendviceViewController.vice = viceManager.getVicedream(at: selectedIndexPath.row)
            finalspendviceViewController.delegate = self
        } else if let navController = segue.destination
            as? UINavigationController,
            let finalspendviceViewController = navController.topViewController
                as? FinalSpendViceViewController {
            finalspendviceViewController.delegate = self
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

/*
//
//  ViceTableViewController.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/18/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import UIKit

extension ViceTableViewController: AddViceViewControllerDelegate {
    func saveVicedream(_ vicedream: Vicedream) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            viceManager.updateVicedream(at: selectedIndexPath.row, with: vicedream)
        } else {
            viceManager.addVicedream(vicedream)
        }
        tableView.reloadData()
    }
}

class ViceTableViewController: UITableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow,
            let addviceViewController = segue.destination
                as? AddViceViewController {
            addviceViewController.vice = viceManager.getVicedream(at: selectedIndexPath.row)
            addviceViewController.delegate = self
        } else if let navController = segue.destination
            as? UINavigationController,
            let addviceViewController = navController.topViewController
                as? AddViceViewController {
            addviceViewController.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return viceManager.vicedreamsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vicedreamCell", for: indexPath)
        let vice = viceManager.getVicedream(at: indexPath.row)
        cell.textLabel?.text = vice.name
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viceManager.removeVicedream(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
*/

