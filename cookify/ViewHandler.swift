//
//  ViewHandler.swift
//  cookify
//
//  Created by Enzo Kaniewska on 18.01.23.
//

import SwiftUI

struct ViewHandler: View {
    
    //This view handles the states of creating the recipe
    //and shows the right view depending on which state the user is at
    
    @State var recipeState:RecipeState
    @State var smartRecipe = SmartRecipe()
    var body: some View {
        
        switch(recipeState){
            
        case .selectingIngredients:
            IngredientsSelectorScreen(recipeState: $recipeState, smartRecipe: $smartRecipe)
            
        case .waitingForResponse:
            LoadingScreen(smartRecipe: $smartRecipe, recipeState: $recipeState)
            
        case .presentingRecipe:
            RecipeView(recipe: smartRecipe)
            
        }
    }
}

struct ViewHandler_Previews: PreviewProvider {
    static var previews: some View {
        ViewHandler(recipeState: .selectingIngredients)
    }
}

enum RecipeState{
    case selectingIngredients
    case waitingForResponse
    case presentingRecipe
}
