//
//  ContentView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ViewHandler(recipeState: RecipeState.selectingIngredients)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}