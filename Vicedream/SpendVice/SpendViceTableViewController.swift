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
}
