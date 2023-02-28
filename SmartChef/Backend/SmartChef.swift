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
        let url = URL(string: "https://info.smartchef.ai/recipe")!
        let json : [String:Any] =
        [
            "ingredients": ingredientNames,
            "tools": []
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        //create URL session and define escaping closure
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                onCompletion(nil, error)
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            let string = String(data: data, encoding: .utf8)
            print(responseJSON! as! [String:Any])
            if let responseJSON = responseJSON as? [String: Any] {
                if let recipeResponse = RecipeResponse(json: responseJSON){
                    onCompletion(recipeResponse, nil)
                }
            }
        }

        task.resume()
        
    }
    
    static func getAllNutrients(onCompletion: @escaping ([NutrientData]?, Error?)->Void){
        
        let url = URL(string: "https://info.smartchef.ai/ingredients")!
        
        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
       
        //create URL session and define escaping closure
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                onCompletion(nil, error)
                return
            }
            var nutrientArr = [NutrientData]()
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [[String: Any]] {
                
                for ingredientData in responseJSON {
                    nutrientArr.append(NutrientData(ingredientData: ingredientData))
                }
                
                onCompletion(nutrientArr, nil)
            
                
            }
            
            onCompletion(nil, error)
            
        }
        task.resume()

        
    }
    
    static func getAllIngredients(onCompletion: @escaping ([Ingredient]?, Error?)->Void){
        
        getAllNutrients { nutrientDataArr, error in
            if let nutrientDataArr = nutrientDataArr, error == nil{
                let ingredientsArr = nutrientDataArr.map{
                    Ingredient(id: UUID().uuidString,
                               name: $0.title,
                               category: IngredientType(rawValue: $0.category)!
                    )
                }
                onCompletion(ingredientsArr, nil)
            }else{
                onCompletion(nil, error)
            }
        }
    }
    

    
    static func searchIngredients(searchInput:String, onCompletion: @escaping ([String]?, Error?)->Void){
        
        let url = URL(string: "https://info.smartchef.ai/searchIngredients?query=\(searchInput)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
       
        //create URL session and define escaping closure
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                onCompletion(nil, error)
                return
            }
            var results = [String]()
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [[String: Any]] {
                
                results = responseJSON.map { $0["name"] as? String ?? "n/a" }
                onCompletion(results, nil)
            
                
            }
            
            onCompletion(nil, error)
            
        }
        task.resume()
    }
    
    
    
}
