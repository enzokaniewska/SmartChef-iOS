//
//  IngredientListItem.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 16.02.23.
//

import SwiftUI

struct IngredientListItem: View {
    
    @State var ingredient:Ingredient
    var addedIngredient: ()->Void
    
    var body: some View {
        VStack {
            HStack{
                
                Text(ingredient.name)
                    .font(.title3)
               
                
                
                    
                NavigationLink {
                    NutrientDetailView(ingredient: ingredient)
                } label: {
                    Label("information", systemImage: "info.circle.fill")
                        .labelStyle(.iconOnly)
                        .foregroundColor(Color(uiColor: UIColor.tertiaryLabel))
                }
                
                Spacer()
                
                
                Label("Add", systemImage: "plus")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.green)
                    .font(.title2)
                    .padding(.trailing, 20)
                    .onTapGesture {
                        addedIngredient()
                        let tapticFeedback = UIImpactFeedbackGenerator(style: .light)
                        tapticFeedback.impactOccurred()
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

struct IngredientListItem_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListItem(ingredient: Ingredient(id: UUID().uuidString, name: "Apple", category: .fruit)){
            
        }
    }
}
