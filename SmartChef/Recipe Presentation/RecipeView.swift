//
//  RecipeView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import SwiftUI

struct RecipeView: View {
    
    @State var smartRecipe: SmartRecipe
    @State var isBookmarked:Bool = false
    @State var showDiscardButton:Bool = true
    var didSelectNewRecipe : ()->Void
    var body: some View {
        
        ScrollView {
           
            VStack(alignment: .leading){
                
                HStack {
                    Text(smartRecipe.response!.name)
                        .font(.title)
                        .bold()
                        .padding()
                      
                    
                  
                    
                    Label("Bookmark", systemImage: (isBookmarked ? "bookmark.fill":"bookmark"))
                        .labelStyle(.iconOnly)
                        .font(.title)
                        .onTapGesture {
                            isBookmarked.toggle()
                            smartRecipe.isBookmarked = isBookmarked
                            
                            if isBookmarked{
                                RecipeStorage.saveRecipe(recipe:smartRecipe)
                            }else{
                                RecipeStorage.removeRecipe(smartRecipe: smartRecipe)
                            }
                        }
                        .foregroundColor(.green)
                    
                    
                }
                if let servingAmount = smartRecipe.response!.servingAmount {
                    Text("Serving amount: \(servingAmount)")
                        .font(.title2)
                        .bold()
                        .padding()
                }
                
            
                
                Text("Ingredients:")
                    .font(.title2)
                    .padding()
                    .bold()
                
                ForEach(smartRecipe.response!.ingredients){ ingredient in
     
                    Text("\(ingredient.name) - \(ingredient.amount)")
                        .padding(.leading)
                
                }
                    
                Text("Instructions")
                    .font(.title2)
                    .bold()
                    .padding()
                
                ForEach(smartRecipe.response!.steps, id: \.self){ step in
                
                    Text(step)
                        .padding(.bottom)
                    
                }
                .padding(.horizontal)
                
                if(!smartRecipe.response!.tips.isEmpty){
                    
                    Text("Tips")
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    ForEach(smartRecipe.response!.tips, id: \.self){ tip in
                        
                        Text(tip)
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
                
                
                if showDiscardButton{
                    HStack {
                        Spacer()
                        Button("Discard Recipe") {
                            didSelectNewRecipe()
                        }
                            .tint(.red)
                            .font(.title2)
                            .buttonStyle(.bordered)
                        Spacer()
                    }
                }
                

            
            
                
                
            }
            
        }
        .onAppear{
            self.isBookmarked = smartRecipe.isBookmarked
        }
        
    }
}

struct RecipeView_Previews: PreviewProvider {
 
    
    static var previews: some View {
        
        RecipeView(smartRecipe: SmartRecipe(response: RecipeResponse.getTestResponse()!)) {
            
        }
            
    }
}
