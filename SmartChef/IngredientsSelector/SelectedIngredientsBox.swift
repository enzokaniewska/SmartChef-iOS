//
//  SelectedIngredientsBox.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct SelectedIngredientsBox: View {
    
    @Binding var selectedIngredients:[Ingredient]
    
    var didRemoveItem : (Ingredient) -> Void
    
    let columns = [
        GridItem(.flexible(minimum: 80)),
    ]
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary)
                .offset(y: -15)
                .shadow(radius: 4, y: -5)
            HStack {
                Text("Your selection")
                    .font(.title3)
                    .padding(.leading, 25)
                    .foregroundColor(.primary)
                Spacer()
            }
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: columns, alignment: .center, spacing: 20) {
                    
                    ForEach(selectedIngredients){ ingredient in
                        
                        ZStack {
                            IngredientCell(ingredient: ingredient)
                                .onTapGesture {
                                    didRemoveItem(ingredient)
                                }
                                .frame(width:70, height: 70)
                            Circle()
                                .frame(width:25)
                                .foregroundColor(.red)
                                .overlay{
                                    Label("x", systemImage: "")
                                        .foregroundColor(.white)
                                        .labelStyle(.titleOnly)
                                        .font(.title2)
                                        .offset(y: -2)
                                }
                                .offset(x:30, y:-30)
                        }
                    }
                }
                .padding(.top, 4)
                .padding(.horizontal,10)
                .padding(.bottom,20)
            }
            
        }
    }
}

struct SelectedIngredientsBox_Previews: PreviewProvider {
    static var previews: some View {
        SelectedIngredientsBox(selectedIngredients: .constant(Ingredient.testData)){ ingredient in
            
        }
    }
}
