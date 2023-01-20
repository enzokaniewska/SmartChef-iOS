//
//  LoadingScreen.swift
//  cookify
//
//  Created by Enzo Kaniewska on 17.01.23.
//

import SwiftUI

struct LoadingScreen: View {
    
    @Binding var smartRecipe:SmartRecipe
    @Binding var recipeState:RecipeState
    
    var body: some View {
        
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.green)
                .ignoresSafeArea()
            VStack{
                
                Text("The AI is crafting your dish...")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                Text("This can take up to a minute")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(3)
                    
                ProgressView()
                    .padding()
                    .foregroundColor(.white)
                    
                
            }
        }
        //when loading screen appears, backend logic is used
        //after the API returns a valid recipe, the state is changed
        .onAppear{
            smartRecipe.generateRecipe { recipe, error in
                 
                if let recipe = recipe, error == nil{
                    
                    withAnimation(.easeIn(duration: 0.2)){
                        recipeState = .presentingRecipe
                    }
                    
                }
                
            }
        }
        
    }
    

}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen(smartRecipe: .constant(SmartRecipe()), recipeState: .constant(.waitingForResponse))
    }
}
