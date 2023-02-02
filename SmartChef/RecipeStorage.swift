//
//  RecipeStorage.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 02.02.23.
//

import Foundation

struct RecipeStorage{
    
    private static let fileName = "savedRecipes.txt"
    
    
    static func saveRecipe(response: RecipeResponse){
        
        let data = readFile()
        
        if let data = data{
            var savedRecipesJson = getArray(fromData: data)
            if var savedRecipesJson = savedRecipesJson {
                
                savedRecipesJson.append(response.data)
                
                let jsonData = try? JSONSerialization.data(withJSONObject: savedRecipesJson, options: .prettyPrinted)
                
                if let jsonData = jsonData{
                    
                    writeFile(data: jsonData)
                }
                
                
                
            }else{
                
                var savedRecipesJson = [response.data]
                let jsonData = try? JSONSerialization.data(withJSONObject: savedRecipesJson, options: .prettyPrinted)
                
                if let jsonData = jsonData{
                    
                    writeFile(data: jsonData)
                }
                
                
                
            }
        }
        
    }
    
    static func removeRecipe(response: RecipeResponse){
        
        let data = readFile()
        
        if let data = data{
            
            var json = getArray(fromData: data)
            
            if var json = json{
                
                json = json.filter{ $0["title"] as? String == response.title}
                
                let updatedData = try? JSONSerialization.data(withJSONObject: json)
                
                if let updatedData = updatedData{
                    
                    writeFile(data: updatedData)
                }
            }
            
            
        }
        
        
    }
    
    static func loadSavedRecipes()->[SmartRecipe]{
        
        let data = readFile()
        var recipes = [SmartRecipe]()
        
        if let data = data{
            
            let recipesJson = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]]
            
            if let recipesJson = recipesJson{
               
                for recipeData in recipesJson{
                    recipes.append(SmartRecipe(response: RecipeResponse(json: recipeData)!))
                }
                
                
            }
        }
            
        
        
        
        return recipes
        
    }
    
    private static func readFile()->Data?{
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        let path = documentsDirectory.appendingPathComponent(fileName)
        let data = try? Data(contentsOf: path)
        if data == nil{
            return Data()
        }
        return data
        
    }
    
    private static func writeFile(data:Data){
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        let path = documentsDirectory.appendingPathComponent(fileName)
        
        do{
            try data.write(to: path)
        }catch{
            print(error)
        }
        
        
    }
    
    private static func getArray(fromData data:Data)->[[String:Any]]?{
        
        return try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
        
    }
    
    
    
    
}
