//
//  ActionsTableViewController.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 15/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import UIKit

class ActionsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
    }
    
    // called to show new recipes, viewdidload doesn't load new recipes
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalRecipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath)

        cell.textLabel?.text = globalRecipes[indexPath.row].name + " needs attention"

        return cell
    }
    
    
    //MARK: -Custom Swiping Behavior
    // Add custom swiping behavior
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        <#code#>
//    }
//    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
