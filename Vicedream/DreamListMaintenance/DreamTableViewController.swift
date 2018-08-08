//
//  ViceTableViewController.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/18/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import UIKit

extension DreamTableViewController: AddDreamViewControllerDelegate {
    func saveVicedream(_ vicedream: Vicedream) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            dreamManager.updateVicedream(at: selectedIndexPath.row, with: vicedream)
        } else {
            dreamManager.addVicedream(vicedream)
        }
        tableView.reloadData()
    }
}

class DreamTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow,
            let adddreamViewController = segue.destination
                as? AddDreamViewController {
            adddreamViewController.dream = dreamManager.getVicedream(at: selectedIndexPath.row)
            adddreamViewController.delegate = self
        } else if let navController = segue.destination
            as? UINavigationController,
            let adddreamViewController = navController.topViewController
                as? AddDreamViewController {
            adddreamViewController.delegate = self
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
        return dreamManager.vicedreamsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vicedreamCell", for: indexPath)
        let dream = dreamManager.getVicedream(at: indexPath.row)
        cell.textLabel?.text = dream.name
        cell.detailTextLabel?.text = String(dream.rate) + (dream.hourly ? "/hour" : "")
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
            dreamManager.removeVicedream(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
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
