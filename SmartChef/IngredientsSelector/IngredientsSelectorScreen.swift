//
//  IngredientsSelector.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct IngredientsSelectorScreen: View {
    
    @EnvironmentObject var modelData:ModelData
    @State var selectedIngredients:[Ingredient] = [] {
        didSet{
            smartRecipe.setIngredients(ingredients: selectedIngredients)
        }
    }
    @State var selectedCategory:IngredientType = .meat
    @Binding var recipeState:RecipeState
    @Binding var smartRecipe:SmartRecipe
    
    var body: some View {
        
         NavigationView{
             
            VStack {
                
                ScrollView {
                    
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
                }
                
                
                SelectedIngredientsBox(
                    selectedItems: $selectedIngredients,
                    recipeState: $recipeState
                    ){ removedIngredient in
                    
                    let index = selectedIngredients.firstIndex { $0.id == removedIngredient.id }
                    withAnimation(.easeIn(duration: 0.2)){
                        selectedIngredients.remove(at: index!)
                    }
                }
              
                
            }
            .navigationTitle("Ingredients Selector")
            .accentColor(.green)
        }
    }
}

struct IngredientsSelector_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsSelectorScreen(recipeState: .constant(.selectingIngredients), smartRecipe: .constant(SmartRecipe()))
            .environmentObject(ModelData())
    }
}
