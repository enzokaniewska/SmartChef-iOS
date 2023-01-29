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
                
                Spacer()
                
                Text("AI is crafting your dish...")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Text("This can take up to a minute")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(3)
                    
                Spacer()
                    
                LoadingAnimationView()
                    
                    
                Spacer()
                Image("smartchef_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
            }
        }
        //when loading screen appears, backend logic is used
        //after the API returns a valid recipe, the state is changed
        .onAppear{
            SmartChef.getRecipe(ingredients: smartRecipe.recipeRequest.ingredients) { recipeResponse, error in
                if let response = recipeResponse, error  == nil{
                    self.smartRecipe.response = response
                    self.recipeState = .presentingRecipe
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
