//
//  EarnDreamTableViewController.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/21/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import UIKit

extension EarnDreamTableViewController: FinalEarnDreamViewControllerDelegate {
    func saveHistory(_ history: History) {
        historyManager.addHistory(history)
    }
}

class EarnDreamTableViewController: UITableViewController {
    
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
        return dreamManager.vicedreamsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vicedreamCell", for: indexPath)
        let dream = dreamManager.getVicedream(at: indexPath.row)
        cell.textLabel?.text = dream.name
        cell.detailTextLabel?.text = String(dream.rate) + (dream.hourly ? "/hour" : "")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow,
            let finalearndreamViewController = segue.destination
                as? FinalEarnDreamViewController {
            finalearndreamViewController.dream = dreamManager.getVicedream(at: selectedIndexPath.row)
            finalearndreamViewController.delegate = self
        } else if let navController = segue.destination
            as? UINavigationController,
            let finalearndreamViewController = navController.topViewController
                as? FinalEarnDreamViewController {
            finalearndreamViewController.delegate = self
        }
    }
}
