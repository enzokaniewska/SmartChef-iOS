//
//  CategoryRow.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct CategoryRow: View {
    
    @Binding var selectedCategory:IngredientType
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Categories")
                    .font(.title3)
                    
                    
                Spacer()
            }
            
            .padding(.leading)
            
            
            ScrollView(.horizontal){
                
                HStack(spacing:15){
                    
                    ForEach(IngredientType.allCases, id: \.self){ category in
                        CategoryCell(category: category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                            .foregroundColor(category == selectedCategory ? .green : .gray)
                    }
                    
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(selectedCategory: .constant(.fruit))
    }
}
