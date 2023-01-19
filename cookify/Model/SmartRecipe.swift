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
    var getSteps:[Step]?{
        let stepsData = recipeData?["steps"] as? [[String:Any]]
        var steps = [Step]()
        
        if let stepsData = stepsData{
            for step in stepsData{
                let step = Step(
                    number: step["number"] as! Int,
                    description: step["description"] as! String)
                steps.append(step)
            }
            
            return steps
        }
        return nil
    }
    var getTools:[String:Any]?{
        recipeData?["tools"] as? [String:String]
    }
    var getIngredients:[RecipeIngredient]?{
        let ingredientsData = recipeData?["ingridients"] as? [[String:Any]]
        var recipeIngredients = [RecipeIngredient]()

        
        if let ingredientsData = ingredientsData{
            for ingredient in ingredientsData{
                let recipeIngredient = RecipeIngredient(
                    name: ingredient["name"] as! String,
                    amount: ingredient["amount"] as! String,
                    caloties: ingredient["kcal"] as! Int
                )
                recipeIngredients.append(recipeIngredient)
            }
            return recipeIngredients
        }
        return nil
    }
    func generateRecipe(onCompletion: @escaping ([String:Any]?,Error?)->Void){
        
        SmartChef.getRecipe(ingredients: ingredients) { recipeData, error in
            self.recipeData = recipeData
            onCompletion(recipeData, error)
        }
        
    }
    

    static var testRecipe:SmartRecipe{
        let smartRecipe = SmartRecipe()
        smartRecipe.getTestRecipe()
        return smartRecipe
    }
    func getTestRecipe(){
        let jsonData = """
{
    "title": "Tuna Rice Pilaf",
    "servingAmount": 4,
    "ingridients": [
        {
            "name": "Rice",
            "amount": "2 cups",
            "kcal": 686
        },
        {
            "name": "Onion",
            "amount": "1 medium",
            "kcal": 44
        },
        {
            "name": "Tuna",
            "amount": "1 can (7 oz)",
            "kcal": 179
        },
        {
            "name": "Basic Spices",
            "amount": "to taste",
            "kcal": 0
        }
    ],
    "tools": [
        "Oven",
        "Stove",
        "Frying Pan"
    ],
    "steps": [
        {
            "number": 1,
            "description": "Preheat oven to 350°F (177°C)."
        },
        {
            "number": 2,
            "description": "In a large frying pan, heat 2 tablespoons of oil over medium heat. Add the onions and sauté for 5 minutes until softened."
        },
        {
            "number": 3,
            "description": "Add the rice and cook for 2 minutes, stirring occasionally."
        },
        {
            "number": 4,
            "description": "Stir in the tuna and spices and cook for 1 minute."
        },
        {
            "number": 5,
            "description": "Transfer the mixture to a greased baking dish and bake for 25 minutes."
        },
        {
            "number": 6,
            "description": "Serve the Tuna Rice Pilaf hot."
        }
    ],
    "optionalSteps": [
        {
            "number": 1,
            "description": "For extra flavor, add a tablespoon of chopped fresh herbs to the rice before baking."
        }
    ]
}
"""
        let data = Data(jsonData.utf8)
        
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON as? [String: Any] {
            self.recipeData = responseJSON
        }
        
    }
    
}
