//
//  SimpleSwitchTableViewCell.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 18/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import UIKit

class SimpleSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBAction func simpleSwitch(_ sender: UISwitch) {
        if sender.isOn{
            AddRecipeViewController.action = true
        } else {
            AddRecipeViewController.action = false
        }
    }
    
}
