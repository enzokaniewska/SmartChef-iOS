//
//  IngredientSelectorView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import SwiftUI

struct IngredientSelectorView: View {
    
    @State var selectedCategory:IngredientType = .fruit
    
    let columns = [GridItem(.adaptive(minimum:100)),
                   GridItem(.adaptive(minimum:100)),
                   GridItem(.adaptive(minimum:100)),
                   GridItem(.adaptive(minimum:100))]
    
    var ingredients = Ingredient.testData
    var filteredIngredients: [Ingredient]{
        ingredients.filter{ $0.category == selectedCategory}
    }
    var didSelectItem : (Ingredient)->Void
    
    var body: some View {
        
        VStack{
           
            CategoryRow(selectedCategory: $selectedCategory)
            
            HStack {
                Text("Ingredients")
                    .font(.title3)
                    .padding(.leading)
                
                Spacer()
            }
            
            LazyVGrid(columns: columns , spacing: 40) {
                
                ForEach(filteredIngredients){ingredient in
                    
                    IngredientCell(ingredient: ingredient)
                        .transition(.opacity)
                        .onTapGesture {
                            didSelectItem(ingredient)
                        }
                        .frame(width: 70, height: 70)
                    
                }
                
            }
            .padding(.horizontal, 6)
            
        }
        
        
        
        
    }
}

struct IngredientSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSelectorView { ingredient in
            
        }
    }
}
