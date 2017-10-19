//
//  RecipeDetailTableViewController.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 18/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import UIKit

class RecipeDetailTableViewController: UITableViewController {
    
    var recipe: Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCellIdentifier", for: indexPath)
        cell.textLabel?.text = recipe?.name
        return cell
    }
}
