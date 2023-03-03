//
//  ModelData.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 10.02.23.
//

import Foundation
import SwiftUI

final class ModelData: ObservableObject{
    
    @Published var ingredientList:[Ingredient] = getIngredientList()
    
}


func getIngredientList() -> [Ingredient]{
    
    let url = Bundle.main.url(forResource: "ingredients", withExtension: ".json")
    
    
    let data = try? Data(contentsOf: url!)
    
    var ingredientList = [Ingredient]()
    if let data = data{
        
        let jsonArray = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]]
        
        if let jsonArray = jsonArray{
            
            for object in jsonArray{
                
                if let ingredient = Ingredient(json: object){
                    ingredientList.append(ingredient)
                }
                
            }
            
        }
        
    }
    return ingredientList

}

