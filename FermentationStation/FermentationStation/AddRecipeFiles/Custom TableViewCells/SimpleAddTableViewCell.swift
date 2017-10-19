//
//  SimpleAddTableViewCell.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 18/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import UIKit

class SimpleAddTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func endedEditing(_ sender: UITextField) {
        if let text = nameTextField.text {
            AddRecipeViewController.name = text
        }
    }
}
