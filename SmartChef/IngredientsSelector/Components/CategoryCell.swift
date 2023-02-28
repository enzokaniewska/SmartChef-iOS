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
        
        VStack {
                 
            Text(category.rawValue)
                .lineLimit(nil)
                .foregroundColor(.white)
                .frame(width: 130, height: 70)
    
        }
        .background(.green)
        .cornerRadius(10)
      
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: .fruit)
    }
}
