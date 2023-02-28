//
//  Nutrients.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 08.02.23.
//

import Foundation

struct NutrientData:Identifiable{
    
    var id: Int
    var title:String
    var category:String
    var calories:Double
    var joules:Double
    var fat:Double
    var saturatedFat:Double
    var monoSaturatedFat:Double
    var polySaturatedFat:Double
    var cholesterol_mg:Double
    var carbohydrates:Double
    var sugars:Double
    var starch:Double
    var fiber:Double
    var protein:Double
    var salt:Double
    var alcohol:Double
    var water :Double
    var vitaminA_RE_μgRE:Double
    var vitaminA_RAE_μgRE:Double
    var retinol_μg:Double
    var betaCaroteneActivity_μgBCE:Double
    var betaCarotene_μg:Double
    var vitaminB1Thiamin_μg:Double
    var vitaminB2Riboflavin_μg:Double
    var vitaminB6Pyridoxine_μg:Double
    var vitaminB12Cobalamin_μg:Double
    var niacin_mg:Double
    var folate_μg:Double
    var panthothenicAcid_mg :Double
    var vitaminC_mg :Double
    var vitaminD_μg :Double
    var vitaminEActivity_mgATE :Double
    var potassium_mg :Double
    var sodium_mg :Double
    var chloride_mg:Double
    var calcium_mg :Double
    var magnesium_mg :Double
    var phosphorus_mg :Double
    var iron_mg :Double
    var iodide_μg :Double
    var zinc_mg:Double
    var selenium_μg :Double
    
    init(ingredientData: [String:Any]) {
        
        self.id = ingredientData["id"] as? Int ?? Int.random(in: 0...1000)
        self.title = ingredientData["name"] as? String ?? "N/A"
        self.category = ingredientData["category"] as? String ?? "N/A"
        self.calories = ingredientData["calories"] as? Double ?? 0.0
        self.joules = ingredientData["joules"] as? Double ?? 0.0
        self.fat = ingredientData["fat"] as? Double ?? 0.0
        self.saturatedFat = ingredientData["saturatedFat"] as? Double ?? 0.0
        self.monoSaturatedFat = ingredientData["monoSaturatedFat"] as? Double ?? 0.0
        self.polySaturatedFat = ingredientData["polySaturatedFat"] as? Double ?? 0.0
        self.cholesterol_mg = ingredientData["cholesterol_mg"] as? Double ?? 0.0
        self.carbohydrates = ingredientData["carbohydrates"] as? Double ?? 0.0
        self.sugars = ingredientData["sugars"] as? Double ?? 0.0
        self.starch = ingredientData["starch"] as? Double ?? 0.0
        self.fiber = ingredientData["fiber"] as? Double ?? 0.0
        self.protein = ingredientData["protein"] as? Double ?? 0.0
        self.salt = ingredientData["salt"] as? Double ?? 0.0
        self.alcohol = ingredientData["alcohol"] as? Double ?? 0.0
        self.water = ingredientData["water"] as? Double ?? 0.0
        self.vitaminA_RE_μgRE = ingredientData["vitaminA_RE_μgRE"] as? Double ?? 0.0
        self.vitaminA_RAE_μgRE = ingredientData["vitaminA_RAE_μgRE"] as? Double ?? 0.0
        self.retinol_μg = ingredientData["retinol_μg"] as? Double ?? 0.0
        self.betaCaroteneActivity_μgBCE = ingredientData["betaCaroteneActivity_μgBCE"] as? Double ?? 0.0
        self.betaCarotene_μg = ingredientData["betaCarotene_μg"] as? Double ?? 0.0
        self.vitaminB1Thiamin_μg = ingredientData["vitaminB1Thiamin_μg"] as? Double ?? 0.0
        self.vitaminB2Riboflavin_μg = ingredientData["vitaminB2Riboflavin_μg"] as? Double ?? 0.0
        self.vitaminB6Pyridoxine_μg = ingredientData["vitaminB6Pyridoxine_μg"] as? Double ?? 0.0
        self.vitaminB12Cobalamin_μg = ingredientData["vitaminB12Cobalamin_μg"] as? Double ?? 0.0
        self.niacin_mg = ingredientData["niacin_mg"] as? Double ?? 0.0
        self.folate_μg = ingredientData["folate_μg"] as? Double ?? 0.0
        self.panthothenicAcid_mg = ingredientData["panthothenicAcid_mg"] as? Double ?? 0.0
        self.vitaminC_mg = ingredientData["vitaminC_mg"] as? Double ?? 0.0
        self.vitaminD_μg = ingredientData["vitaminD_μg"] as? Double ?? 0.0
        self.vitaminEActivity_mgATE = ingredientData["vitaminEActivity_mgATE"] as? Double ?? 0.0
        self.potassium_mg = ingredientData["potassium_mg"] as? Double ?? 0.0
        self.sodium_mg = ingredientData["sodium_mg"] as? Double ?? 0.0
        self.chloride_mg = ingredientData["chloride_mg"] as? Double ?? 0.0
        self.calcium_mg = ingredientData["calcium_mg"] as? Double ?? 0.0
        self.magnesium_mg = ingredientData["magnesium_mg"] as? Double ?? 0.0
        self.phosphorus_mg = ingredientData["phosphorus_mg"] as? Double ?? 0.0
        self.iron_mg = ingredientData["iron_mg"] as? Double ?? 0.0
        self.iodide_μg = ingredientData["iodide_μg"] as? Double ?? 0.0
        self.zinc_mg = ingredientData["zinc_mg"] as? Double ?? 0.0
        self.selenium_μg = ingredientData["selenium_μg"] as? Double ?? 0.0
    }
    
    var macronutrients:[String:Double]{
        
        return [
            "Protein": protein,
            "Carbohydrates": carbohydrates,
            "Fats": fat,
        ]
    }
    
    var micronutrients:[String:Double]{
        
        var microsDict = [String:Double]()
        
        if vitaminA_RE_μgRE != 0.0{
            microsDict["Vitamin A RE"] = vitaminA_RE_μgRE
            
        }
        if vitaminB1Thiamin_μg != 0.0{
            microsDict["Vitamin B1 Thiamin"] = vitaminB1Thiamin_μg
            
        }
        if vitaminB2Riboflavin_μg != 0.0{
            microsDict["Vitamin B Riboflavin"] = vitaminB2Riboflavin_μg
            
        }
        if vitaminB6Pyridoxine_μg != 0.0{
            microsDict["Vitamin B Pyridoxine"] = vitaminB6Pyridoxine_μg
            
        }
        if vitaminB12Cobalamin_μg != 0.0{
            microsDict["Vitamin B12 Cobalamin"] = vitaminB12Cobalamin_μg
        }
        if vitaminC_mg != 0.0{
            microsDict["Vitamin C"] = vitaminC_mg
        }
        if vitaminD_μg != 0.0{
            microsDict["Vitamin D"] = vitaminD_μg
        }
        if magnesium_mg != 0.0{
            microsDict["Magnesium"] = magnesium_mg
        }
        if zinc_mg != 0.0{
            microsDict["Zinc"] = zinc_mg
        }
        return microsDict
    }
}
enum NutrientDataKeys:String{
    
    case calories = "calories"
    case joules = "joules"
    case fat = "fat"
    case saturatedFat = "saturatedFat"
    case monoSaturatedFat = "monoSaturatedFat"
    case polySaturatedFat = "polySaturatedFat"
    case cholesterol_mg = "cholesterol_mg"
    case carbohydrates = "carbohydrates"
    case sugars = "sugars"
    case starch = "starch"
    case fiber = "fiber"
    case protein = "protein"
    case salt = "salt"
    case alcohol = "alcohol"
    case water = "water"
    case vitaminA_RE_μgRE = "vitaminA_RE_μgRE"
    case vitaminA_RAE_μgRE = "vitaminA_RAE_μgRE"
    case retinol_μg = "retinol_μg"
    case betaCaroteneActivity_μgBCE = "betaCaroteneActivity_μgBCE"
    case betaCarotene_μg = "betaCarotene_μg"
    case vitaminB1Thiamin_μg = "vitaminB1Thiamin_μg"
    case vitaminB2Riboflavin_μg = "vitaminB2Riboflavin_μg"
    case vitaminB6Pyridoxine_μg = "vitaminB6Pyridoxine_μg"
    case vitaminB12Cobalamin_μg = "vitaminB12Cobalamin_μg"
    case niacin_mg = "niacin_mg"
    case folate_μg = "folate_μg"
    case panthothenicAcid_mg = "panthothenicAcid_mg"
    case vitaminC_mg = "vitaminC_mg"
    case vitaminD_μg = "vitaminD_μg"
    case vitaminEActivity_mgATE = "vitaminEActivity_mgATE"
    case potassium_mg = "potassium_mg"
    case sodium_mg = "sodium_mg"
    case chloride_mg = "chloride_mg"
    case calcium_mg = "calcium_mg"
    case magnesium_mg = "magnesium_mg"
    case phosphorus_mg = "phosphorus_mg"
    case iron_mg = "iron_mg"
    case iodide_μg = "iodide_μg"
    case zinc_mg = "zinc_mg"
    case selenium_μg = "selenium_μg"
    
    
}
