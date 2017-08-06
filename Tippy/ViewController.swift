//
//  ViewController.swift
//  Tippy
//
//  Created by hotspotonlineinc on 8/2/17.
//  Copyright © 2017 com.tj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    let defaults = UserDefaults.standard
    @IBOutlet weak var billFiled: UITextField!
    @IBOutlet weak var tipPercent: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let tip = defaults.integer(forKey: "tipIndex")
        tipPercent.selectedSegmentIndex = tip
        tipLabel.text = String(format: "$%.2f", 0.0)
        totalLabel.text = String(format: "$%.2f", 0.0)
        billFiled.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func updateTip(_ sender: Any) {
        calculateTip(sender)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentage = [0.18, 0.2, 0.25]
        let bill = Double(billFiled.text!) ?? 0
        let tip = bill * tipPercentage[tipPercent.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

