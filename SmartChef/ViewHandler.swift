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
    
    @EnvironmentObject var modelData:ModelData
    @Binding var recipeState:RecipeState
    @State var smartRecipe = SmartRecipe()
    
    var body: some View {
        
        switch(recipeState){
            
        case .selectingIngredients:
            IngredientsSelectorScreen(recipeState: $recipeState, smartRecipe: $smartRecipe)
                .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .move(edge: .top).combined(with: .opacity)))
                .environmentObject(modelData)
            
        case .waitingForResponse:
            LoadingScreen(smartRecipe: $smartRecipe, recipeState: $recipeState)
                .transition(.opacity)
            
        case .presentingRecipe:
            RecipeView(smartRecipe: smartRecipe, didSelectNewRecipe: {
                self.smartRecipe = SmartRecipe()
                self.recipeState = .selectingIngredients
            })
            .transition(.slide)
            
        }
    }
}

struct ViewHandler_Previews: PreviewProvider {
    static var previews: some View {
        ViewHandler(recipeState: .constant(.selectingIngredients))
            .environmentObject(ModelData())
    }
}

enum RecipeState{
    case selectingIngredients
    case waitingForResponse
    case presentingRecipe
}
