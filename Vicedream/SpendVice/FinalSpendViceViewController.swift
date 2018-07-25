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
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var hoursText: UITextField!
    @IBOutlet weak var spendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let vice = vice {
            nameLabel.text = vice.name
            rateLabel.text = "\(vice.rate)"
            if vice.hourly == false {
                hoursLabel.isHidden = true
                hoursText.isHidden = true
            }
                
        }
        numGood()
    }
    
    func numGood(){
        if hoursText.isHidden == true {
            spendButton.isEnabled = true
        }
        else {
            if hoursText.text!.isEmpty{
                spendButton.isEnabled = false
            }
            else {
                let texthold = hoursText.text
                if texthold!.doubleValue != nil {
                    spendButton.isEnabled = true
                }
                else {
                    spendButton.isEnabled = false
                }
            }
        }
    }
    
    @IBAction func hoursGood(_ sender: Any) {
        numGood()
    }
    

    @IBAction func spendVice(_ sender: Any) {
        let newHistory = History(vicedream: vice!, vicenotdream: true)
        delegate?.saveHistory(newHistory)
        (vice!.hourly == false) ?
            (pointBalance -= vice!.rate) :
            (pointBalance -= vice!.rate * Double(hoursText.text!)!)
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
