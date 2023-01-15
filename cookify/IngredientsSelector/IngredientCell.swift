//
//  IngredientCell.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct IngredientCell: View {
    
    @State var ingredient: Ingredient
    
    var body: some View {
        
        
        VStack(alignment: .center) {
            
            ZStack {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.2))
                    .cornerRadius(10)
                .frame(width: 100, height:100)
                
                ingredient.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }

            Text(ingredient.name)
                .font(.subheadline)
                .foregroundColor(.black)
            
        }
    }
}

struct IngredientCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCell(ingredient: Ingredient(id: UUID().uuidString,name: "Apple", image: Image("ingredient2")))
    }
}
