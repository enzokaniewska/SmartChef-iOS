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
        
        ScrollView {
            VStack(alignment: .leading){
               
                Text(recipe.getTitle ?? "n/a")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                
                
                VStack(alignment:.leading) {
                    
                    Text("Ingredients:")
                        .font(.title2)
                        .padding(.bottom, 2)
                        .bold()
                    
                    ForEach(recipe.getIngredients!){ ingredient in
                        
                    
                        Text("\(ingredient.name) - \(ingredient.amount)")
                            
                        
                       
                
                    }
                }
                
                .padding()
                .background(.green.gradient)
                .cornerRadius(10)
                
                
                ForEach(recipe.getSteps!){ step in
                    
                    
                    Text("Step \(step.number)")
                        .font(.title2)
                        .bold()
                    
                    Text(step.description)
                        .padding(.bottom)
                    
                }
               
                
            }
            .padding(.horizontal)
        }
        
        
    }
}

struct RecipeView_Previews: PreviewProvider {
 
    
    static var previews: some View {
        
        
        RecipeView(recipe: SmartRecipe.testRecipe)
            
    }
}
