//
//  RecipeView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import SwiftUI

struct RecipeView: View {
    
    @State var recipe: SmartRecipe
    var body: some View {
        
        VStack{
           
            Text(recipe.getTitle ?? "n/a")
                .font(.title)
            
        }
        
        
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        
        var recipe = SmartRecipe(ingredients: [])
        
        RecipeView(recipe: recipe)
    }
}
