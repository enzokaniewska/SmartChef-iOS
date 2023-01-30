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
    
}

enum IngredientType:String, CaseIterable{
    case vegetable = "Vegetable"
    case fruit = "Fruit"
    case meat = "Meat"
    case Carbs = "Carbs"
    case Diary = "Diary"
}


//Extension with test data
extension Ingredient{
    
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
        Ingredient(id: UUID().uuidString, name: "Tomato", image: Image("tomato"), category: .vegetable),
        //Meat
        Ingredient(id: UUID().uuidString, name: "Beef", image: Image("meat0"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Salmon", image: Image("meat1"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Bacon", image: Image("meat2"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Sausage", image: Image("meat4"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Ground Beef", image: Image("minced-meat"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Chicken Breast", image: Image("chicken-breast"), category: .meat),
        //diary
        Ingredient(id: UUID().uuidString, name: "Cheese", image: Image("diary0"), category: .Diary),
        Ingredient(id: UUID().uuidString, name: "Eggs", image: Image("diary1"), category: .Diary),
        Ingredient(id: UUID().uuidString, name: "Feta", image: Image("feta"), category: .Diary),
        Ingredient(id: UUID().uuidString, name: "Mozarella", image: Image("mozzarella"), category: .Diary),
        
        //carbs
        Ingredient(id: UUID().uuidString, name: "Pasta", image: Image("penne"), category: .Carbs),
        Ingredient(id: UUID().uuidString, name: "Sweet Potato", image: Image("sweetpotato"), category: .Carbs),
        Ingredient(id: UUID().uuidString, name: "Potato", image: Image("potato"), category: .Carbs),
        Ingredient(id: UUID().uuidString, name: "Rice", image: Image("rice"), category: .Carbs),
        Ingredient(id: UUID().uuidString, name: "Couscous", image: Image("couscous"), category: .Carbs)
        
    ]
    
}
