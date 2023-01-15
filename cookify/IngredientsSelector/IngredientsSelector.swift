//
//  IngredientsSelector.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct IngredientsSelector: View {
    
    @State var selectedIngredients = [Ingredient(id: UUID().uuidString,name: "Apple", image: Image("ingredient2")),Ingredient(id: UUID().uuidString,name: "Orange", image: Image("ingredient5")),Ingredient(id: UUID().uuidString,name: "Watermelon", image: Image("ingredient11"))]

    var body: some View {
        
        ScrollView {
            
            VStack{
                
                HStack {
                    Text("Your selected Ingredients")
                        .font(.title3)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                SelectedIngredientsBox(selectedIngredients: $selectedIngredients)
                    .padding()
                
                Divider()
                HStack {
                    Text("Select the things you have at home.")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    
                    Spacer()
                }
                
                CategoryRow()
                    .padding(.leading)
                HStack {
                    Text("Ingredients")
                        .font(.title3)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                
                
            
        
                IngredientsGrid { selectedIngredient in
                    
                    if !self.selectedIngredients.contains(where: { ingredient in
                        return ingredient.id == selectedIngredient.id
                    }){
                        selectedIngredients.append(selectedIngredient)
                    }
                    
                }
                
                
                
                
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
