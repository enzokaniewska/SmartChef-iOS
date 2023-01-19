//
//  RecipeIngredient.swift
//  cookify
//
//  Created by Enzo Kaniewska on 18.01.23.
//

import Foundation


//These classes represent the data in the recipe JSON that is returned by the API


struct RecipeIngredient:Identifiable{
    
    var id = UUID().uuidString
    var name:String
    var amount:String
    var caloties: Int
    
}

struct Tool{
    
    var name:String
    
}

struct Step:Identifiable{
    
    var id = UUID().uuidString
    var number:Int
    var description:String
    
}
