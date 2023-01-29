//
//  SmartRecipe.swift
//  cookify
//
//  Created by Enzo Kaniewska on 29.01.23.
//

import Foundation


class SmartRecipe{
    
    var recipeRequest = RecipeRequest()
    var response: RecipeResponse?
    
    init(response: RecipeResponse){
        self.response = response
    }
    init(){
        self.response = nil
    }
    
    func setIngredients(ingredients: [Ingredient]){
        recipeRequest.setIngredients(ingredients: ingredients)
    }
    
    
    
    
}
