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
            
                
                Image("smartchef_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .offset(y: 100)
                
                
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
