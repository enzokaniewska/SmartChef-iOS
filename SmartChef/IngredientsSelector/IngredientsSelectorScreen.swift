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
                        //check if ingredient is already selected
                        if !self.selectedIngredients.contains(where: { ingredient in
                            return ingredient.id == selectedIngredient.id
                        }){
                            //if not, add it with animation
                            withAnimation(.spring()){
                                selectedIngredients.insert(selectedIngredient, at: 0)
                            }
                            
                            
                        }
                        
                    }
                    .padding(.bottom,50)
                }
            }
            
            
            SelectedIngredientsBox(selectedIngredients: $selectedIngredients){ removedIngredient in
                
                let index = selectedIngredients.firstIndex { ingredient in
                    return removedIngredient.id == ingredient.id
                }
                withAnimation(.easeIn(duration: 0.2)){
                    selectedIngredients.remove(at: index!)
                }
            }
            .frame(height: 260)
            
            Button {
                smartRecipe.setIngredients(ingredients: selectedIngredients)
                withAnimation(.easeIn(duration: 0.2)){
                    recipeState = .waitingForResponse
                }
            } label: {
                Label("Generate Recipe", systemImage: "")
                    .labelStyle(.titleOnly)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .padding(.vertical,3)
                    .padding(.horizontal, 30)
                    .font(.title3)
                    .bold()
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
        }
    }
}

struct IngredientsSelector_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsSelectorScreen(recipeState: .constant(.selectingIngredients), smartRecipe: .constant(SmartRecipe()))
    }
}
