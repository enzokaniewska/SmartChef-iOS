//
//  CategoryRow.swift
//  cookify
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import SwiftUI

struct CategoryRow: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("Categories")
                    .font(.headline)
                    
                Spacer()
            }
            .padding(.top)
            
            
            
            ScrollView(.horizontal){
                
                HStack(spacing:15){
                    
                    ForEach(0..<10){ i in
                        VStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .frame(width: 100, height:60)
                            
                            Text("Category \(i)")
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
    }
}
