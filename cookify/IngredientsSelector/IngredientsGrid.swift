//
//  IngredientsGrid.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct IngredientsGrid: View {
    var body: some View {
        
        Grid {
            
            ForEach(0..<4) { item in
            
                GridRow(alignment: .center){
                    
                    ForEach(0..<3){ i in
                       
                        VStack(alignment: .center) {
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.3))
                                    .cornerRadius(10)
                                .frame(width: 100, height:100)
                                
                                Image("ingredient\((item * 3) + i + 2)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                
                                
                            }
                            
                            Text("Food nr. \((item * 3) + i)")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            
                        }
                        .padding(.horizontal,12)
                    }
                }
            }
        }
        .gridColumnAlignment(.center)
    }
}

struct IngredientsGrid_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsGrid()
    }
}
