//
//  ContentView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            
            ViewHandler(recipeState: RecipeState.selectingIngredients)
                .tabItem{
                    Label("Creator", systemImage: "checklist")
                        .symbolRenderingMode(.hierarchical)
                }
            RecipeListView()
                .tabItem{
                    Label("Saved Recipes", systemImage: "bookmark.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                }
            
        }
        .tint(.green)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
