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
    @Binding var recipeState:RecipeState
    @Binding var smartRecipe:SmartRecipe
    
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
                            withAnimation(.easeIn(duration: 0.2)) {
                                selectedIngredients.insert(selectedIngredient, at: 0)
                            }
                            
                                
                        }
                        
                    }
                    .padding(.bottom,30)
                    
                    
                }
            }
            
           
            SelectedIngredientsBox(selectedIngredients: $selectedIngredients)
                .frame(height: 260)
            
            Button {
                smartRecipe.addIngredients(ingredients: selectedIngredients)
                recipeState = .waitingForResponse
            } label: {
                Label("Create", systemImage: "")
                    .labelStyle(.titleOnly)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .padding(.vertical,3)
                    .padding(.horizontal, 30)
                    .font(.title3)
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
        
        }
    }
}

struct IngredientsSelector_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsSelectorScreen(recipeState: .constant(.selectingIngredients), smartRecipe: .constant(SmartRecipe(ingredients: [])))
    }
}
