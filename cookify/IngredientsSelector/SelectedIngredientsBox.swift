//
//  SelectedIngredientsBox.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct SelectedIngredientsBox: View {
    
    @Binding var selectedIngredients:[Ingredient]
    
    let columns = [
           GridItem(.adaptive(minimum:100)),
           GridItem(.adaptive(minimum:100)),
           GridItem(.adaptive(minimum:100))
       ]
    
    var body: some View {
        
        
        LazyVGrid(columns: columns, alignment: .center) {
            
            ForEach(selectedIngredients){ ingredient in
                
                IngredientCell(ingredient: ingredient)
                    .onTapGesture {
                        selectedIngredients.filter { $0.id != ingredient.id }
                    }
            }
        }
        .padding(10)
        .padding(.vertical, 25)
        .cornerRadius(20)
       
    }
}

struct SelectedIngredientsBox_Previews: PreviewProvider {
    static var previews: some View {
        SelectedIngredientsBox(selectedIngredients: .constant(Ingredient.getTestList()))
    }
}
