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
            Rectangle()
                .foregroundColor(.green)
                .cornerRadius(10)
                .frame(width: 100, height:70)
                .overlay{
                    Image(category.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                }
            
            Text(category.rawValue)
                .lineLimit(0)
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: .fruit)
    }
}
