//
//  IngredientsGrid.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct IngredientsGrid: View {
    
    @State var selectedCategory: IngredientType = .meat
    
    var didSelectItem : (Ingredient)->Void
    var ingredients = Ingredient.testData
    var filteredIngredients: [Ingredient]{
        ingredients.filter{ $0.category == selectedCategory}
    }
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
   
    var body: some View {
        
        LazyVGrid(columns: columns , spacing: 40) {
            
            ForEach(ingredients){ingredient in
                
                IngredientCell(ingredient: ingredient)
                    .onTapGesture {
                        didSelectItem(ingredient)
                    }
                    .frame(width: 80, height: 80)
                
            }
            
        }
        .padding(.horizontal, 6)
        
        
    }
}

struct IngredientsGrid_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsGrid { item in
            
        }
    }
}
