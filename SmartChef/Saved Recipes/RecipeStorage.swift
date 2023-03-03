//
//  RecipeStorage.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 02.02.23.
//

import Foundation

struct RecipeStorage{
    
    private static let fileName = "savedRecipes.txt"
    
    
    static func saveRecipe(recipe: SmartRecipe){
        
        let data = readFile()
        
        if let data = data{
            let savedRecipesJson = getArray(fromData: data)
            if var savedRecipesJson = savedRecipesJson {
                
                var newRecipeData = recipe.response!.data
                newRecipeData["id"] = recipe.id
            
                savedRecipesJson.append(newRecipeData)
                
                let jsonData = try? JSONSerialization.data(withJSONObject: savedRecipesJson, options: .prettyPrinted)
                
                if let jsonData = jsonData{
                    
                    writeFile(data: jsonData)
                }
                
                
                
            }else{
                
                var newRecipeData = recipe.response!.data
                newRecipeData["id"] = recipe.id
                
                let savedRecipesJson = [newRecipeData]
                let jsonData = try? JSONSerialization.data(withJSONObject: savedRecipesJson, options: .prettyPrinted)
                
                if let jsonData = jsonData{
                    
                    writeFile(data: jsonData)
                }
                
                
                
            }
        }
        
    }
    
    static func removeRecipe(smartRecipe: SmartRecipe){
        
        let data = readFile()
        
        if let data = data{
            
            let savedRecipesJson = getArray(fromData: data)
            if let savedRecipesJson = savedRecipesJson {
                
                let newSavedRecipesJson = savedRecipesJson.filter{ $0["id"] as? String != smartRecipe.id}
                
                let updatedData = try? JSONSerialization.data(withJSONObject: newSavedRecipesJson)
                
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
            
            let recipesJson = getArray(fromData: data)
            
            if let recipesJson = recipesJson{
               
                for recipeData in recipesJson{
                    if let id = recipeData["id"] as? String{
                        let newRecipe = SmartRecipe(id: id, data: recipeData)
                        newRecipe.isBookmarked = true
                        if newRecipe.response != nil{
                            recipes.append(newRecipe)
                        }
                    }
                    
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
        
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
            return json
        }catch{
            print(error)
        }
        
        return(nil)
        
        
    }
    
    
    
    
}
