//
//  Recipe.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 15/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import Foundation

private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
private let archiveURL = documentsDirectory.appendingPathComponent("recipes")

class Recipe: NSObject, NSCoding {
    var name: String
    var ingredients: [String: String]
    var action: Bool
    
    init(name:String, ingredients: [String: String], action:Bool) {
        self.name = name
        self.ingredients = ingredients
        self.action = action
    }
    
    // MARK: Coding
    struct PropertyKeys {
        static let name = "name"
        static let ingredients = "ingredients"
        static let action = "action"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:PropertyKeys.name)
        aCoder.encode(ingredients, forKey: PropertyKeys.ingredients)
        aCoder.encode(action, forKey:PropertyKeys.action)
    }
    
    // action should be decoded with the decodeBool and cast to Bool? else the init will fail
    convenience required init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey:PropertyKeys.name) as? String,
            let ingredients = aDecoder.decodeObject(forKey: PropertyKeys.ingredients) as? [String:String], let action = aDecoder.decodeBool(forKey: PropertyKeys.action) as? Bool
            else {
                print("decoding failed")
                return nil
        }
        
        self.init(name: name, ingredients: ingredients, action: action)
    }
    
    static func saveToFile(recipes:[Recipe]) {
        NSKeyedArchiver.archiveRootObject(recipes, toFile: archiveURL.path)
        
    }
    
    static func loadFromFile() -> [Recipe]? {
        let unarchivedRecipes = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? [Recipe]
        return unarchivedRecipes
    }
}
