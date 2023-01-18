//
//  SmartChef.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import Foundation

struct SmartChef{
    
    
    static func getRecipe(ingredients: [Ingredient], onCompletion: @escaping ([String:Any]?, Error?)->Void){
        
        let ingredientNames = ingredients.map { $0.name }
        let url = URL(string: "http://127.0.0.1:5000/recipe")!
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

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                onCompletion(nil, error)
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                onCompletion(responseJSON, nil)
            }
        }

        task.resume()
        
    }
    
    
    
}
