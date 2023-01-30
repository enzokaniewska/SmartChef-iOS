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
                    .lineLimit(nil)
                    .frame(height: 40)
                    .multilineTextAlignment(.center)
                    .offset(y: -5)
                    .lineSpacing(-10)
                    
                
                
            }
        }
        
    }
}

struct IngredientCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCell(ingredient: Ingredient(id: UUID().uuidString,name: "Ground Beef Oma", image: Image("fruit0"), category: .fruit))
            .frame(width: 80, height: 80)
    }
}
