//
//  AddItemTableViewCell.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 17/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import UIKit

protocol AddItemButtonPressedDelegate {
    func didPressAdditemButom(name: String, amount:String)
    
}

class AddItemTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate: AddItemButtonPressedDelegate?
    
    @IBOutlet weak var ingredientNameLabel: UITextField!
    @IBOutlet weak var ingredientAmountLabel: UITextField!
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        // the delegate will create the add the ingredient
        delegate?.didPressAdditemButom(name: ingredientNameLabel.text!, amount: ingredientAmountLabel.text! )
        ingredientAmountLabel.text = ""
        ingredientNameLabel.text = ""
    }
    
    
}
