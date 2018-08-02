//
//  FinalSpendViceViewController.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/21/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import UIKit

protocol FinalSpendViceViewControllerDelegate {
    func saveHistory(_ history: History)
}

class FinalSpendViceViewController: UIViewController {
    var delegate: FinalSpendViceViewControllerDelegate?
    var vice: Vicedream?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateText: UITextField!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var hoursText: UITextField!
    @IBOutlet weak var spendButton: UIButton!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeFlipper: UISegmentedControl!
    @IBOutlet weak var savelistLabel: UILabel!
    @IBOutlet weak var savelistSwitch: UISwitch!
    @IBAction func cancelButton(_ sender: Any) {
        dismissOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let vice = vice {
            typeLabel.isHidden = true
            typeFlipper.isHidden = true
            nameLabel.isHidden = false
            rateLabel.isHidden = false
            savelistLabel.isHidden = true
            savelistSwitch.isHidden = true
            nameText.isHidden = true
            rateText.isHidden = true
            nameLabel.text = vice.name
            rateLabel.text = "\(vice.rate)"
            if vice.hourly == false {
                hoursLabel.isHidden = true
                hoursText.isHidden = true
            }
                
        }
        else {
            nameLabel.isHidden = true
            rateLabel.isHidden = true
            nameText.isHidden = false
            rateText.isHidden = false
            typeLabel.isHidden = false
            typeFlipper.isHidden = false
            savelistLabel.isHidden = false
            savelistSwitch.isHidden = false
            savelistSwitch.isOn = true
        }
        allGood()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBAction func nameChange(_ sender: Any) {
        allGood()
    }
    
    @IBAction func rateChange(_ sender: Any) {
        allGood()
    }
    
    @IBAction func hoursChange(_ sender: Any) {
        allGood()
    }
    
    @IBAction func flipperFlipped(_ sender: Any) {
        allGood()
        if typeFlipper.selectedSegmentIndex == 0{
                hoursText.isEnabled = true
        }
        else {
            hoursText.isEnabled = false
        }
    }
    
    func allGood() {
        _ = numGood()
        if (hoursGood() && nameGood() && numGood()){
            spendButton.isEnabled = true
        }
        else {
            spendButton.isEnabled = false
        }
    }
    
    func nameGood() -> Bool {
        if (nameText.text!.isEmpty && (nameText.isHidden == false)){
            return false
        }
        else {
            return true
        }
    }
    
    func numGood() -> Bool{
        if rateText.isHidden == true {
            return true
        }
        else {
            if rateText.text!.isEmpty{
                return false
            }
            else {
                let texthold = rateText.text
                if texthold == "-" {
                    rateText.text = ""
                }
                if let valx = texthold!.doubleValue {
                    if (valx > 0) {
                        rateText.text = "-" + rateText.text!
                    }
                    return true
                }
                else {
                    return false
                }
            }
            
        }
    }
    
    func hoursGood() -> Bool{
        if(hoursText.isHidden) {
            return true
        }
        if(typeFlipper.selectedSegmentIndex == 1){
            return true
        }
        else {
            let texthold = hoursText.text
            if texthold!.doubleValue != nil {
                return true
            }
            else {
                return false
            }
        }
    }
    
    @IBAction func spendVice(_ sender: Any) {
        var vicey:Vicedream
        if savelistSwitch.isHidden == false {
            vicey = Vicedream(
                name: nameText.text!,
                rate: Double(rateText.text!)!,
                hourly: (typeFlipper.selectedSegmentIndex == 0 ? true : false)
            )
            if savelistSwitch.isOn {
                viceManager.addVicedream(vicey)
            }
        }
        else {
          vicey = vice!
        }
        let newHistory = History(vicedream: vicey, vicenotdream: true)
        historyManager.addHistory(newHistory)
        (vicey.hourly == false) ?
            (pointBalance += vicey.rate) :
            (pointBalance += vicey.rate * Double(hoursText.text!)!)
        dismissOutX()
    }
    
    func dismissOut() {
        if savelistSwitch.isHidden == true {
            navigationController!.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    func dismissOutX() {
        if savelistSwitch.isHidden == true {
            dismiss(animated: true, completion: nil)
        }
        else{
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
