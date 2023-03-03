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
             
             VStack(spacing: 0) {
                
                ScrollView {
                    
                    IngredientSelectorView { selectedIngredient in
                        //check if ingredient is already selected
                        addItem(newIngredient: selectedIngredient)
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
            .toolbar {
                NavigationLink {
                    SearchView { ingredient in
                        addItem(newIngredient: ingredient)
                    }
                } label: {
                    Label("Search", systemImage: "magnifyingglass")
                        .foregroundColor(.green)
                }

                
            }
            
        }
        .accentColor(.green)
        
    }
    
    func addItem(newIngredient: Ingredient){
        if !self.selectedIngredients.contains(where: { ingredient in
            return ingredient.id == newIngredient.id
        }){
            //if not, add it with animation
            withAnimation(.spring()){
                selectedIngredients.insert(newIngredient, at: 0)
            }
        }
    }
}

struct IngredientsSelector_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsSelectorScreen(recipeState: .constant(.selectingIngredients), smartRecipe: .constant(SmartRecipe()))
            .environmentObject(ModelData())
    }
}
