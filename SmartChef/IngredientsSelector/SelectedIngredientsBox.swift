//
//  NewSelectedItemsBox.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 22.02.23.
//

import SwiftUI

struct SelectedIngredientsBox: View {
    
    @Binding var selectedItems:[Ingredient]
    @State var minimized = true
    @Binding var recipeState: RecipeState
    var didRemoveItem : (Ingredient) -> Void
    var body: some View {
        
        VStack {
            VStack{
             
                Label("Arrow", systemImage: "arrow.up.circle.fill")
                    .labelStyle(.iconOnly)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.white)
                    .rotationEffect(minimized ? Angle(degrees: 0): Angle(degrees: 180))
                    .animation(.spring(), value: minimized)
                    .font(.title)
                    .onTapGesture {
                        minimized.toggle()
                    }
                    .padding(.top, 5)
                
                Text(minimized ? "\(selectedItems.count) Items selected" : "Your selected Items")
                    .font(.title2)
                    .foregroundColor(.white)
                    .animation(.easeIn(duration: 0.1), value: minimized)
                    .clipped()
                
                if !minimized{
                    
                    ScrollView{
                        ForEach(selectedItems) { item in
                            
                            SelectedIngredientListItem(ingredient: item){
                                didRemoveItem(item)
                            }
                        }
                    }
                    .transition(.asymmetric(insertion: .push(from: .bottom), removal: .push(from: .top)))
                }
            }
            .frame(height: minimized ? 80 : 250, alignment: .top)
            GenerateButton(recipeState: $recipeState)
        }
        .background(.green)
        .animation(.spring(), value: minimized)
    }
}

struct SelectedItemsBox_Previews: PreviewProvider {
    static var previews: some View {
        
        
        VStack {
            Spacer()
            SelectedIngredientsBox(selectedItems:.constant([
                ModelData().ingredientList[0],
                ModelData().ingredientList[1],
                ModelData().ingredientList[2],
                ModelData().ingredientList[3],
                ModelData().ingredientList[4]]), recipeState: .constant(.selectingIngredients)){ item in
                    
                }
        }
    }
}


struct GenerateButton: View {
    @Binding var recipeState:RecipeState
    var body: some View {
        HStack {
            Spacer()
            Button {
                
                recipeState = .waitingForResponse
                
            } label: {
                Label("Generate Recipe", systemImage: "")
                    .labelStyle(.titleOnly)
                    .foregroundColor(.black)
                    .padding(.vertical,4)
                    .padding(.horizontal, 30)
                    .font(.title3)
                    .bold()
                
            }
            .tint(.white)
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
            Spacer()
        }
    }
}
