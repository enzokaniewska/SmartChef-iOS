//
//  Ingredient.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import Foundation
import SwiftUI


struct Ingredient: Identifiable{
    
    var id:String
    var name:String
    var image:Image
    
    
    static func getTestList()->[Ingredient]{
        
        var ingredients = [Ingredient]()
        for i in 0...14{
            ingredients.append(Ingredient(id: UUID().uuidString, name: "Ingredient \(i)", image: Image("ingredient\(i)")))
        }
        return ingredients
    }
}
