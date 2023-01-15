//
//  IngredientsGrid.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct IngredientsGrid: View {
    
    var didSelectItem : (Ingredient)->Void
    
    @State var ingredients = Ingredient.getTestList()
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]) {
            
            ForEach(ingredients){ingredient in
                
                IngredientCell(ingredient: ingredient)
                    .onTapGesture {
                        didSelectItem(ingredient)
                    }
                
            }
            
        }
        .padding(.horizontal)
    }
}

struct IngredientsGrid_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsGrid { item in
            
        }
    }
}
