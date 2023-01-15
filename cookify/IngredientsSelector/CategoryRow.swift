//
//  CategoryRow.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct CategoryRow: View {
    
    var categories = ["Fruit", "Vegetables", "Meats", "Diary", "Carbs", "Fats"]
    var body: some View {
        
        VStack {
            HStack {
                Text("Categories")
                    .font(.title3)
                    
                Spacer()
            }
            .padding(.top)
            
            
            
            ScrollView(.horizontal){
                
                HStack(spacing:15){
                    
                    ForEach(categories, id: \.self){ category in
                        VStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .frame(width: 100, height:60)
                            
                            Text(category)
                                .padding(.bottom)
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
    }
}
