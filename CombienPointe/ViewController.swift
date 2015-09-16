//
//  ViewController.swift
//  CombienPointe
//
//  Created by Muddassar Sajjad on 7/14/15.
//  Copyright (c) 2015 com.pointe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipPercentSegmentCtrlr: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set any defaults
        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func billAmount_OnEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipPercentSegmentCtrlr.selectedSegmentIndex];
        var currentBillAmt = (billTextField.text as NSString).doubleValue;  // Cheap way ignoring possibility of parsing errors
        var tip : Double = tipPercentage * currentBillAmt;
        tipLabel.text = String(format:"$%.2f", tip);
        totalLabel.text = String(format:"%.2f", currentBillAmt + tip);
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

