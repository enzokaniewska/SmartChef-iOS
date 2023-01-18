//
//  SmartRecipe.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import Foundation

class SmartRecipe{
    
    var ingredients: [Ingredient]
    
    init(ingredients: [Ingredient]) {
        self.ingredients = ingredients
    }
    init(){
        ingredients = []
    }
    func addIngredients(ingredients: [Ingredient]){
        self.ingredients = ingredients
    }
    var recipeData:[String: Any]?
    
    var getTitle:String?{
        recipeData?["title"] as? String
    }
    var getServingAmount:Int?{
        recipeData?["servingAmount"] as? Int
    }
    var getSteps:[String:Any]?{
        recipeData?["steps"] as? [String:Any]
    }
    var getTools:[String:Any]?{
        recipeData?["tools"] as? [String:String]
    }
    var getIngredients:[String:String]?{
        recipeData?["ingridients"] as? [String:String]
    }
    func generateRecipe(onCompletion: @escaping ([String:Any]?,Error?)->Void){
        
        SmartChef.getRecipe(ingredients: ingredients) { recipeData, error in
            self.recipeData = recipeData
            onCompletion(recipeData, error)
        }
        
    }
    
}
