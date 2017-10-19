//
//  RecipesTableViewController.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 15/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // no unnceccesary rows in the table
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalRecipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCellIdentifer", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath:IndexPath) {
        let recipe = globalRecipes[indexPath.row]
        cell.textLabel?.text  = recipe.name
    }
    
    //MARK: navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "DetailRecipeView" {
            let indexPath = tableView.indexPathForSelectedRow!
            let recipe = globalRecipes[indexPath.row]
            let recipeDetailView = segue.destination as! RecipeDetailTableViewController
            recipeDetailView.recipe = recipe
        }
    }
    
    
    // called when the user is done adding the recipe
    // will unwind the view and return to the RecipeTableViewController
    @IBAction func unwindFromAddingRecipe(_ segue:UIStoryboardSegue) {
        if segue.identifier == "saveRecipeSegue" {
            print(globalRecipes.count)
            let sourceViewController =  segue.source as! AddRecipeViewController
            sourceViewController.saveRecipe()
            self.tableView.reloadData()
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // delete the recipe from the globalRecipes variable
            globalRecipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
