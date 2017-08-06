//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Tauseef Jamadar on 8/5/17.
//  Copyright © 2017 com.tj. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    let defaults = UserDefaults.standard
    @IBOutlet weak var defaultLabel: UILabel!
    let pickerDataSource: [String] = UserDefaults.standard.array(forKey: "pickerDataSource") as! [String];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let tip = defaults.integer(forKey: "tipIndex")
        self.pickerView.selectRow(tip, inComponent: 0, animated: true)
        defaultLabel.text = pickerDataSource[tip]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        defaults.set(row, forKey: "tipIndex")
        defaultLabel.text = pickerDataSource[row]
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
