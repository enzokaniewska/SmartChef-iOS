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
        GridItem(.adaptive(minimum:80)),
        GridItem(.adaptive(minimum:80)),
        GridItem(.adaptive(minimum:80)),
        GridItem(.adaptive(minimum:80))
    ]
    
    var body: some View {
        
        VStack {
            Rectangle()
                .frame(height: 1)
                .offset(y: -7)
                .foregroundColor(.green)
                .padding(.horizontal)
            HStack {
                Text("Your selected Ingredients")
                    .font(.title3)
                    .padding(.leading, 25)
                    .foregroundColor(.primary)
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 40) {
                    
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
                .padding(10)
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
