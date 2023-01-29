//
//  LoadingAnimation.swift
//  cookify
//
//  Created by Enzo Kaniewska on 25.01.23.
//

import SwiftUI

struct LoadingAnimationView: View {
    
    let delays = [0, 0.25, 0.5, 0.75]
    
  
    
    var body: some View {
        
    
        ZStack(){
            
            ForEach(delays, id: \.self) { delay in
                
                DotView(delay:delay)
                    .foregroundColor(.white)
                    
                
            }
            
                
        }
        .padding(.vertical, 40)
        
    }
}

struct LoadingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.green)
                .ignoresSafeArea()
            LoadingAnimationView()
        }
    }
}
