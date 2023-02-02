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
                    Text(smartRecipe.response!.title)
                        .font(.title)
                        .bold()
                        .padding()
                      
                    
                  
                    
                    Label("Bookmark", systemImage: (isBookmarked ? "bookmark.fill":"bookmark"))
                        .labelStyle(.iconOnly)
                        .font(.title)
                        .onTapGesture {
                            isBookmarked.toggle()
                            
                            if isBookmarked{
                                RecipeStorage.saveRecipe(response:smartRecipe.response!)
                            }
                        }
                        .foregroundColor(.green)
                    
                    
                }
                Text("Serving amount: \(smartRecipe.response!.servingAmount)")
                    .font(.title2)
                    .bold()
                    .padding()
            
                
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
                
                ForEach(smartRecipe.response!.instructions){ step in
                    
                    
                    Text("Step \(step.number)")
                        .font(.title3)
                        .bold()
                    
                    Text(step.description)
                        .padding(.bottom)
                    
                }
                .padding(.horizontal)
                
                if(!smartRecipe.response!.optionalSteps.isEmpty){
                    
                    Text("Optional Steps")
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    ForEach(smartRecipe.response!.optionalSteps){ optionalStep in
                        
                        Text("Step \(optionalStep.number)")
                            .font(.title3)
                            .bold()
                        
                        Text(optionalStep.description)
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
        
    }
}

struct RecipeView_Previews: PreviewProvider {
 
    
    static var previews: some View {
        
        RecipeView(smartRecipe: SmartRecipe(response: RecipeResponse.getTestResponse()!)) {
            
        }
            
    }
}
