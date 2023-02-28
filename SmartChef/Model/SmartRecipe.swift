//
//  SmartRecipe.swift
//  cookify
//
//  Created by Enzo Kaniewska on 29.01.23.
//

import Foundation


class SmartRecipe:Identifiable{
    
    
    var id = UUID().uuidString
    var recipeRequest = RecipeRequest()
    var response: RecipeResponse?
    var isBookmarked:Bool = false
    init(response: RecipeResponse){
        self.response = response
    }
    init(id: String, data: [String:Any]){
        self.id = id
        self.response = RecipeResponse(json: data)
    }
    init(){
        self.response = nil
    }
    
    func setIngredients(ingredients: [Ingredient]){
        recipeRequest.setIngredients(ingredients: ingredients)
    }
    
    
    
    
}
