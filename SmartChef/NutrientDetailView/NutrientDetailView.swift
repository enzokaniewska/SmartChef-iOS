//
//  NutrientDetailView.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 10.02.23.
//

import SwiftUI

struct NutrientDetailView: View {
    
    @State var ingredient:Ingredient
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(ingredient.name)
                .font(.title)
                .bold()
                .padding(.bottom)
            
            HStack{
                Text("Energy")
                    .bold()
                Spacer()
                Text("\(Int(ingredient.nutritionData!.calories)) calories")

            }.padding(.bottom)
            
            MacroNutrientView(nutritionData: ingredient.nutritionData!)
                .padding(.bottom)
            
            MicroNutrientView(nutritionData: ingredient.nutritionData!)
            
        }
        .padding(.horizontal)
        
    }
}

struct NutrientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientDetailView(ingredient: ModelData().ingredientList.last!)
    }
}
