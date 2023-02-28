//
//  RecipeListView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 21.01.23.
//

import SwiftUI

struct RecipeListView: View {
    
    @State var savedRecipes = RecipeStorage.loadSavedRecipes()
    
   
    var body: some View {
        NavigationView{
           
            List{
                
                ForEach(savedRecipes){ recipe in
                    
                    NavigationLink {
                        RecipeView(smartRecipe: recipe, showDiscardButton: false) {
                            
                        }
                    } label: {
                        Text(recipe.response!.name)
                    }

                    
                }
                
            }
            .navigationTitle("Saved Recipes")

        }
        .onAppear{
            self.savedRecipes = RecipeStorage.loadSavedRecipes()
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
