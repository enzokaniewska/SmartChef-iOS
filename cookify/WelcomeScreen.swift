//
//  WelcomeScreen.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.green)
            
            VStack(alignment:.leading){
                Text("Welcome to")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .font(.title)
                
                Text("Cookify")
                    .foregroundColor(.white)
                    .font(.system(size: 80))
                    .bold()
              
                 
                
                
                Spacer()
            }
            .padding(.top, 150)

        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
