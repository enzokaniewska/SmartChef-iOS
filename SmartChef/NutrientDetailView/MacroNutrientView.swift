//
//  MacroNutrientView.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 17.02.23.
//

import SwiftUI

struct MacroNutrientView: View {
    
    @State var nutritionData:NutrientData
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Macronutrients")
                .font(.headline)
                .padding(.bottom, 2)
            
            HStack{
                Spacer()
                PieChartView(
                    backgroundColor: Color(uiColor: .systemBackground),
                    colors: [.green, .orange, .red],
                    values: [
                        nutritionData.protein,
                        nutritionData.carbohydrates,
                        nutritionData.fat
                    ]
                )
                .frame(width: 100, height: 100)
                Spacer()
            }
            
            ForEach(Array(nutritionData.macronutrients.keys), id: \.self){ macronutrient in
                
                HStack {
                    
                    switch(macronutrient){
                    case "Protein":
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 15)
                    case "Carbohydrates":
                        Circle()
                            .foregroundColor(.orange)
                            .frame(width: 15)
                    case "Fats":
                        Circle()
                            .foregroundColor(.red)
                            .frame(width: 15)
                    default:
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 15)
                    }
                    
                    Text(macronutrient)
                    Spacer()
                    Text("\(String(format: "%.2f", nutritionData.macronutrients[macronutrient]!)) grams")
                }
                
            }
            
            
            
        }
        
        
        
    }
}

struct MacroNutrientView_Previews: PreviewProvider {
    static var previews: some View {
        MacroNutrientView(nutritionData: ModelData().ingredientList.first!.nutritionData!)
    }
}
