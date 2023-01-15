//
//  IngredientsSelector.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct IngredientsSelector: View {
    var body: some View {
        
        ScrollView {
            
            VStack{
                
                Rectangle()
                    .foregroundColor(.gray.opacity(0.2))
                    .cornerRadius(10)
                    .frame(height: 300)
                    .padding()
                    
                
                
                HStack {
                    Text("Select the things you have at home.")
                        .font(.title2)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                CategoryRow()
                    .padding(.leading)
                HStack {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                
                
            
        
                IngredientsGrid()
                
                
                
                
                Spacer()
                
            }
        }
    }
}

struct IngredientsSelector_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsSelector()
    }
}
