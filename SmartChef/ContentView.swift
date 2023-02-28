//
//  ContentView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData:ModelData
    @State var recipeState = RecipeState.selectingIngredients
    
    
    var body: some View {
        
        TabView{
            
            ViewHandler(recipeState: $recipeState)
                .tabItem{
                    Label("Creator", systemImage: "checklist")
                        .symbolRenderingMode(.hierarchical)
                }
                .environmentObject(modelData)
            RecipeListView()
                .tabItem{
                    Label("Saved Recipes", systemImage: "bookmark.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                }
            
        }
        .onAppear{
            UITabBar.appearance().backgroundColor = UIColor.systemBackground
        }
        .tint(.green)
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
