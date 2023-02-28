//
//  RecipeResponse.swift
//  cookify
//
//  Created by Enzo Kaniewska on 28.01.23.
//

import Foundation

struct RecipeResponse{
    
    var name:String
    var servingAmount:Int?
    var ingredients: [RecipeIngredient]
    var steps: [String]
    var tools:[String]
    var tips: [String]
    var data:[String:Any]
    
    init?(json:[String:Any]){
        guard let title = json["name"] as? String,
              let ingredientsJson = json["ingredients"] as? [[String:Any]],
              let stepsJson = json["steps"] as? [String],
              let tools = json["tools"] as? [String],
              let tipsJson = json["tips"] as? [String]
        else {
            return nil
        }
        
        
        
        self.data = json
        self.name = title
        self.servingAmount = json["servingAmount"] as? Int
        self.tools = tools
        
        //convert json ingredients into model instances
        var ingredients = [RecipeIngredient]()
        for ingredientData in ingredientsJson{
            let name = ingredientData["name"] as! String
            let amount = ingredientData["amount"] as! String
            
            ingredients.append(RecipeIngredient(name: name, amount: amount))
        }
        self.ingredients = ingredients
        //convert json instructions into model instances
        self.steps = []
        for step in stepsJson{
            steps.append(step)
            
        }
        
        //convert json optional steps into model instances
        self.tips = []
        for tip in tipsJson{
            self.tips.append(tip)
        }
        

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
