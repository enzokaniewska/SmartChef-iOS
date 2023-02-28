//
//  MicroNutrientView.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 17.02.23.
//

import SwiftUI

struct MicroNutrientView: View {
    
    @State var nutritionData: NutrientData
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Micronutrients")
                .font(.headline)
                .padding(.bottom, 2)
            
            
            ForEach(Array(nutritionData.micronutrients.keys), id: \.self){ nutrient in
                
                HStack{
                    
                    Text(nutrient)
                    Spacer()
                    if nutrient == "Vitamin C"{
                        Text("\(String(format: "%.2f", nutritionData.micronutrients[nutrient]!))mg")
                    }else{
                        Text("\(String(format: "%.2f", nutritionData.micronutrients[nutrient]!))μg")
                    }
                    
                }
                
            }
            
            
            
        }
    }
}

struct MicroNutrientView_Previews: PreviewProvider {
    static var previews: some View {
        MicroNutrientView(nutritionData: ModelData().ingredientList.first!.nutritionData!)
    }
}
