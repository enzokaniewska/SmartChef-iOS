//
//  CategoryCell.swift
//  cookify
//
//  Created by Enzo Kaniewska on 16.01.23.
//

import SwiftUI

struct CategoryCell: View {
    
    @State var category:IngredientType
    @State var isSelected = false
    var body: some View {
        
        VStack(spacing: -10) {
            
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .padding(10)
                .padding(.horizontal, 20)
                .background(.tertiary)
                .cornerRadius(10)
                
                
            Text(category.rawValue)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .frame(width: 130, height: 70)
    
        }
        
      
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: .fruit)
    }
}
