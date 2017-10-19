//
//  AddRecipeViewController.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 17/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    func saveRecipe() {
        let recipe = Recipe(name: AddRecipeViewController.name, ingredients: ingredients, action: true)
        globalRecipes.append(recipe)
    }
    // variables for setting the ingredients row
    // should not be static, but I don't know how to set them correctly from outside this viewController
    var ingredient: String = ""
    var amount: String = ""
    static var name: String = ""
    static var action: Bool = true
    
    // Right now we have a the tuple for setting the cells and populating the table
    // and we have the dict to store to the archive, tuples can't be stored to the archive
    var ingredients:[String: String] = [:]
    var ingredientsTuple: [(String, String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // so that we can interact and update the tableview in this viewcontroller
        tableView.delegate = self
        tableView.dataSource = self
        // no unnceccesary rows in the table
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
}

// MARK: Tableview
extension AddRecipeViewController: UITableViewDataSource, UITableViewDelegate, AddItemButtonPressedDelegate {
    
    // for adding a new ingredient to the table
    func didPressAdditemButom(name: String, amount:String) {
        
        
        let ingredient = name
        let amount = amount
        

        ingredientsTuple.append((ingredient, amount))
        // also creating a dictionary for creation of Recipe-objects
        ingredients[ingredient]  = amount
        // section 3 here refers to the ingredient-section of the table
        let indexPath = IndexPath(row: ingredients.count - 1 , section:3)
        tableView.insertRows(at: [indexPath], with: .automatic)
        view.endEditing(true)
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            // recipe-name section
            case 0:
                return 1
            // recipe-action section
            case 1:
                return 1
            // recipe-add-ingredient section
            case 2:
                return 1
            // recipe-ingredient-list section
            case 3:
                return ingredients.count
            // recipe-category-picker section
            case 4:
                return 1
            default:
                return 0
        }
    }
    
    // for setting the tile of the section-headers
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "AddHeaderCell") as! AddHeaderTableViewCell
        header.backgroundColor = UIColor.gray
        
        switch section {
            case 0 :
                header.headerLabel.text = "Add Name"
                
                return header
            case 1 :
                header.headerLabel.text = "Add Action"
                
                return header
            case 2:
                header.headerLabel.text = "Add Ingredients"
                
                return header
            case 3:
                header.headerLabel.text = "Ingredients"
                
                return header
            case 4:
                header.headerLabel.text = "Category"
                return header
            default:
                header.headerLabel.text = "Header"
                
                return header
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        switch section {
            case 0 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleAddCellIdentifier", for: indexPath) as! SimpleAddTableViewCell
                cell.NameLabel.text = "Name"
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleSwitchCellIdentifier", for: indexPath) as! SimpleSwitchTableViewCell
                cell.cellLabel.text = "Action"
                return cell
            case 2 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddIngredientCellIdentifier", for: indexPath) as! AddItemTableViewCell
                // when the button is pressed, add the text to the table
                cell.delegate = self
                return cell
            case 3 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientTableViewCell
                cell.ingredientLabel.text = ingredientsTuple[indexPath.row].0
                cell.ingredientAmountLabel.text = ingredientsTuple[indexPath.row].1
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryPickerCellIdentifier", for: indexPath) as! CategoryPickerTableViewCell
                cell.pickerLabel.text = "Category"
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! CategoryPickerTableViewCell
                
                // when the button is pressed, add the text to the table
                cell.pickerLabel.text = "Category"
                return cell
        }
    }
    
}
