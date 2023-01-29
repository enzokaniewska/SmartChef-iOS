//
//  SmartChef.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import Foundation

struct SmartChef{
    
    
    static func getRecipe(ingredients: [Ingredient], onCompletion: @escaping (RecipeResponse?, Error?)->Void){
        
    
        let ingredientNames = ingredients.map { $0.name }
        
        //URL of the SmartChef-API. In this case its localhost
        let url = URL(string: "http://194.233.172.64:5000/recipe")!
        let json : [String:Any] =
        [
            "ingredients": ingredientNames,
            "tools": [
                "Oven",
                "Stove"
            ]
        ]

        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // insert json data to the request
        request.httpBody = jsonData

        //create URL session and define escaping closure
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                onCompletion(nil, error)
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                if let recipeResponse = RecipeResponse(json: responseJSON){
                    onCompletion(recipeResponse, nil)
                }
            }
        }

        task.resume()
        
    }
    
    
    
}
