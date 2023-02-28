//
//  SelectedIngredientListItem.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 22.02.23.
//

import SwiftUI

struct SelectedIngredientListItem: View {
    
    @State var ingredient:Ingredient
    var didRemoveIngredient:()->Void
    var body: some View {
        
        VStack {
            HStack{
                
                Text(ingredient.name)
                    .font(.title3)
                    .foregroundColor(.white)
                
                Label("information", systemImage: "info.circle.fill")
                    .labelStyle(.iconOnly)
                    .foregroundColor(Color(uiColor: UIColor.tertiaryLabel))
                    
                Spacer()
                
                Label("Add", systemImage: "delete.left.fill")
                    .symbolRenderingMode(.hierarchical)
                    .labelStyle(.iconOnly)
                    .foregroundColor(.red)
                    .font(.title2)
                    .padding(.trailing, 20)
                    .onTapGesture {
                        didRemoveIngredient()
                    }
            }
            .padding(.leading)
            .padding(.vertical,5)
           
            Rectangle()
                .foregroundColor(.primary.opacity(0.2))
                .frame(height: 1)
                .padding(.horizontal)
                
            
        }
        
    }
}

struct SelectedIngredientListItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.green)
            SelectedIngredientListItem(ingredient: ModelData().ingredientList.first!) {
                
            }
        }
    }
}
