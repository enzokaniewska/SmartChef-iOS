//
//  RecipeListView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 21.01.23.
//

import SwiftUI

struct RecipeListView: View {
    
    let recipeNames = ["Feta Chicken Pasta","Cheesy Beef Bowl", "Toasted Tuna Rolls", "Salmon Bowl with Couscous" ]
    var body: some View {
        NavigationView{
           
            List{
                
                Text("Feta Chicken Pasta")
                
                Text("Cheesy Beef Bowl")
                
                Text("Toasted Tuna Rolls")
                
                Text("Salmon Bowl with Couscous")
                
            }
            .navigationTitle("Saved Recipes")

        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
