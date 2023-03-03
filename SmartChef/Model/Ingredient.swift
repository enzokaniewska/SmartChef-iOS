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
    var category: IngredientType
    var nutritionData:NutrientData? = nil
    
    init?(json: [String:Any]){
        
        if let id = json["id"] as? String{
            self.id = id
        }else{
            self.id = UUID().uuidString
        }
        
        if let name = json["name"] as? String{
            self.name = name
        }else{
            return nil
        }
        
        if let category = IngredientType(rawValue: json["category"] as? String ?? ""){
            self.category = category
        }else{
            return nil
        }
        
        self.nutritionData = NutrientData(ingredientData: json)
    }
    
    init(id: String, name: String, category: IngredientType){
        self.id = id
        self.name = name
        self.category = category
    }
    
}

enum IngredientType:String, CaseIterable{
    case alcoholicBeverage =  "Alcoholic beverages"
    case bakingIngredients = "Baking Ingredients"
    case beverages = "Beverages"
    case bread = "Bread"
    case cereals = "Cereals"
    case cheese = "Cheeses"
    case dairyProduct = "Dairy Products"
    case dressing = "Dressings"
    case egg = "Eggs"
    case fats = "Fats"
    case fish = "Fish"
    case breakfastCereal = "Flakes & Breakfast Cereal"
    case fruit = "Fruits"
    case herb = "Herbs"
    case meat = "Meats"
    case nutsAndSeeds = "Nuts and seeds"
    case oil = "Oils"
    case sauce = "Sauces"
    case sausagesAndLuncheon = "Sausages & Luncheon Meat"
    case snacks = "Snacks"
    case spices = "Spices"
    case sweets = "Sweets"
    case vegetable = "Vegetables"
}


//Extension with test data
extension Ingredient{
    
    /*
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
        Ingredient(id: UUID().uuidString, name: "Chicken Breast", image: Image("chicken-breast"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Salmon", image: Image("meat1"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Bacon", image: Image("meat2"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Sausage", image: Image("meat4"), category: .meat),
        Ingredient(id: UUID().uuidString, name: "Ground Beef", image: Image("minced-meat"), category: .meat),
        
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
     */
    
}
