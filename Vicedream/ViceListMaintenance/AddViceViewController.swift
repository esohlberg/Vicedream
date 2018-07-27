//
//  AddViceViewController.swift
//  EarnedIt
//
//  Created by Emil Sohlberg on 7/18/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import UIKit


protocol AddViceViewControllerDelegate {
    func saveVicedream(_ vicedream: Vicedream)
}

class AddViceViewController: UIViewController {

    var delegate: AddViceViewControllerDelegate?
    var vice: Vicedream?
    
    // Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var hourlyInstant: UISegmentedControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let vice = vice {
            nameTextField.text = vice.name
            rateTextField.text = String(vice.rate)
            vice.hourly ? (hourlyInstant.selectedSegmentIndex = 0) : (hourlyInstant.selectedSegmentIndex = 1)
            navigationItem.title = "Edit Vice"
        }
        allGood()
    }
    
    func numGood() -> Bool{
        if rateTextField.text!.isEmpty{
            return false
        }
        else {
            let texthold = rateTextField.text
            if texthold == "-" {
                rateTextField.text = ""
            }
            if let valx = texthold!.doubleValue {
                if (valx > 0) {
                    rateTextField.text = "-" + rateTextField.text!
                }
                return true
            }
            else {
                return false
            }
        }
    }
    
    func allGood() {
        _ = numGood()
        if (nameGood() && numGood()){
            saveButton.isEnabled = true
        }
        else {
            saveButton.isEnabled = false
        }
    }
    
    func nameGood() -> Bool {
        if nameTextField.text!.isEmpty {
            return false
        }
        else {
            return true
        }
    }
    @IBAction func rateFull(_ sender: Any) {
        allGood()
    }
    
    @IBAction func checkFull(_ sender: Any) {
        allGood()
    }
    
    
    // Save and Cancel buttons
    @IBAction func cancelEnd(_ sender: Any) {
        dismissOut()
    }
    
    @IBAction func saveEnd(_ sender: Any) {
        let newvice = Vicedream(
            name: nameTextField.text!,
            rate: Double(rateTextField.text!)!,
            hourly: (hourlyInstant.selectedSegmentIndex == 0 ? true : false)
        )
        delegate?.saveVicedream(newvice)
        dismissOut()
    }
        
    func dismissOut() {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
