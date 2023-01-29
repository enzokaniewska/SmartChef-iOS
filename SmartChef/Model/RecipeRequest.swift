//
//  SmartRecipe.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import Foundation

class RecipeRequest{
    
    var ingredients = [Ingredient]()
    var tools = [String]()
    
    func setIngredients(ingredients: [Ingredient]){
        self.ingredients = ingredients
        
    }
 
}
