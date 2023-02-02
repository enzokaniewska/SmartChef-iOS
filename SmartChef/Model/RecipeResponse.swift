//
//  RecipeResponse.swift
//  cookify
//
//  Created by Enzo Kaniewska on 28.01.23.
//

import Foundation

struct RecipeResponse{
    
    var title:String
    var servingAmount:Int
    var ingredients: [RecipeIngredient]
    var instructions: [Step]
    var tools:[String]
    var optionalSteps: [Step]
    var data:[String:Any]
    
    init?(json:[String:Any]){
        guard let title = json["title"] as? String,
              let servingAmount = json["servingAmount"] as? Int,
              let ingredientsJson = json["ingredients"] as? [[String:Any]],
              let stepsJson = json["steps"] as? [[String:Any]],
              let tools = json["tools"] as? [String],
              let optionalStepsJson = json["optionalSteps"] as? [[String:Any]]
        else {
            return nil
        }
        
        self.data = json
        self.title = title
        self.servingAmount = servingAmount
        self.tools = tools
        
        //convert json ingredients into model instances
        var ingredients = [RecipeIngredient]()
        for ingredientData in ingredientsJson{
            let name = ingredientData["name"] as! String
            let amount = ingredientData["amount"] as! String
            let calories = ingredientData["kcal"] as! Int
            
            ingredients.append(RecipeIngredient(name: name, amount: amount, caloties: calories))
        }
        self.ingredients = ingredients
        //convert json instructions into model instances
        var steps = [Step]()
        for stepsData in stepsJson{
            let number = stepsData["number"] as! Int
            let description = stepsData["description"] as! String
            steps.append(Step(number: number, description: description))
        }
        self.instructions = steps
        //convert json optional steps into model instances
        var optionalSteps = [Step]()
        for optionalStepsData in optionalStepsJson{
            let number = optionalStepsData["number"] as! Int
            let description = optionalStepsData["description"] as! String
            optionalSteps.append(Step(number: number, description: description))
        }
        self.optionalSteps = optionalSteps

    }
    
    
}





extension RecipeResponse{
    
    static func getTestResponse()->RecipeResponse?{
        
        let path = Bundle.main.url(forResource: "responseJson", withExtension: "txt")!
        let data = try? Data(contentsOf: path)
        
        if let data = data{
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                return RecipeResponse(json: responseJSON)
            }
        }
        
        return nil
    }
    
    
}
