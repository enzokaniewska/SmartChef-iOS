//
//  IngredientSelectorView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import SwiftUI

struct IngredientSelectorView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var selectedCategory:IngredientType = .fruit
    
    let columns = [GridItem(.adaptive(minimum:100)),
                   GridItem(.adaptive(minimum:100)),
                   GridItem(.adaptive(minimum:100)),
                   GridItem(.adaptive(minimum:100))]
    
    
   
    var didSelectItem : (Ingredient)->Void
    
    var body: some View {
        
        VStack{
           
            CategoryRow(selectedCategory: $selectedCategory)
            
            HStack {
                Text("Ingredients")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                
                Spacer()
            }
            
            
            ScrollView{
                VStack(spacing: 10){
                    ForEach(modelData.ingredientList.filter{ $0.category.rawValue == selectedCategory.rawValue}){ ingredient in
                        
                        IngredientListItem(ingredient: ingredient){
                            didSelectItem(ingredient)
                        }
                        
                    }
                    
                }
                .padding(.top, 5)
         
            }
            
        }
        
        
        
        
    }
}

struct IngredientSelectorView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        IngredientSelectorView { ingredient in
            
        }
        .environmentObject(ModelData())
       
        
    }
}
