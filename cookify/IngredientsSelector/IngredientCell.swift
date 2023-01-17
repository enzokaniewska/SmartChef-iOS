//
//  IngredientCell.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI
import UIKit

struct IngredientCell: View {
    
    @State var ingredient: Ingredient
    
    var body: some View {
        
        GeometryReader{ proxy in
            
            let width = proxy.size.width
            let height = proxy.size.height
            
            VStack(alignment: .center) {
                
                Rectangle()
                    .foregroundColor(Color(UIColor.quaternaryLabel))
                    .cornerRadius(8)
                    .frame(width: width, height:height)
                    .overlay{
                        ingredient.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width*0.6, height: height*0.6)
                    }
                    
                
                Text(ingredient.name)
                    .font(.subheadline)
                
            }
        }
        
    }
}

struct IngredientCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCell(ingredient: Ingredient(id: UUID().uuidString,name: "Apple", image: Image("ingredient2"), category: .fruit))
            .frame(width: 100, height: 100)
    }
}
