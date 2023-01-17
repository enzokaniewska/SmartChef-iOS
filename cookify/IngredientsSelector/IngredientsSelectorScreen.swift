//
//  IngredientsSelector.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct IngredientsSelectorScreen: View {
    
    @State var selectedIngredients:[Ingredient] = []
    @State var selectedCategory:IngredientType = .fruit
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                VStack{
                    
                    
                    HStack {
                        Text("Select the things you have at home.")
                            .font(.title)
                            .bold()
                            .padding(.leading)
                            .padding(.top)
                        Spacer()
                    }
                    
                    IngredientSelectorView { selectedIngredient in
                       
                        if !self.selectedIngredients.contains(where: { ingredient in
                            return ingredient.id == selectedIngredient.id
                        }){
                            selectedIngredients.append(selectedIngredient)
                        }
                        
                    }
                    .padding(.bottom,30)
                    
                    
                }
            }
            
           
            SelectedIngredientsBox(selectedIngredients: $selectedIngredients)
                .ignoresSafeArea()
                .frame(height: 260)
        
        }
    }
}

struct IngredientsSelector_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsSelectorScreen()
    }
}
