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
    var category: IngredientType
    
    
    static let testData : [Ingredient] = [
        //Fruit
        Ingredient(id: UUID().uuidString, name: "Apple", image: Image("fruit0"), category: .fruit),
        Ingredient(id: UUID().uuidString, name: "Lime", image: Image("fruit1"), category: .fruit),
        Ingredient(id: UUID().uuidString, name: "Orange", image: Image("fruit2"), category: .fruit),
        Ingredient(id: UUID().uuidString, name: "Pineapple", image: Image("ingredient9"), category: .fruit),
        //Vegetables
        Ingredient(id: UUID().uuidString, name: "Pepper", image: Image("vegetable0"), category: .vegetable),
        Ingredient(id: UUID().uuidString, name: "Salad", image: Image("vegetable1"), category: .vegetable),
        Ingredient(id: UUID().uuidString, name: "Carrot", image: Image("vegetable2"), category: .vegetable),
        Ingredient(id: UUID().uuidString, name: "Broccoli", image: Image("vegetable3"), category: .vegetable),
        Ingredient(id: UUID().uuidString, name: "Garlic", image: Image("vegetable4"), category: .vegetable),
        //Meat
        Ingredient(id: UUID().uuidString, name: "Beef", image: Image("meat0"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Salmon", image: Image("meat1"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Bacon", image: Image("meat2"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Sausage", image: Image("meat4"), category: .meat),
        //diary
        Ingredient(id: UUID().uuidString, name: "Cheese", image: Image("diary0"), category: .Dairy),
        Ingredient(id: UUID().uuidString, name: "Eggs", image: Image("diary1"), category: .Dairy)
    ]
    static func getTestList()->[Ingredient]{
        
        var ingredients = [Ingredient]()
        
        for i in 0...5{
            ingredients.append(Ingredient(id: UUID().uuidString, name: "Fruit \(i)", image: Image("fruit\(i)"), category: .fruit))
        }
        for i in 0...2{
            ingredients.append(Ingredient(id: UUID().uuidString, name: "Diary \(i)", image: Image("diary\(i)"), category: .Dairy))
        }
        for i in 0...4{
            ingredients.append(Ingredient(id: UUID().uuidString, name: "Meat \(i)", image: Image("meat\(i)"), category: .meat))
        }
        for i in 0...4{
            ingredients.append(Ingredient(id: UUID().uuidString, name: "Vegetable \(i)", image: Image("vegetable\(i)"), category: .vegetable))
        }
       
        return ingredients
    }
}

enum IngredientType:String, CaseIterable{
    case vegetable = "Vegetable"
    case fruit = "Fruit"
    case meat = "Meat"
    case Carbs = "Carbs"
    case Dairy = "Dairy"
}
