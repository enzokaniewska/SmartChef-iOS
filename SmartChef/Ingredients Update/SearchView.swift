//
//  SearchView.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 10.02.23.
//

import SwiftUI

struct SearchView: View {
    
    @State var textInput = ""
    @State var searchResults = [String]()
    @State var submit = false
    var body: some View {
        VStack{
            
            HStack {
                TextField("type in ingredient", text: $textInput)
                    
                    
                Label("search", systemImage: "magnifyingglass")
                    .labelStyle(.iconOnly)
                    .onTapGesture {
                        SmartChef.searchIngredients(searchInput: textInput) { result, error in
                            if let result = result, error == nil{
                                self.searchResults = result
                            }
                        }
                    }
            }
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.secondary, lineWidth: 0.3)
            }
            .padding()
    
            
            
            ForEach(searchResults, id: \.self){ result in
                Text(result)
            }
            
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
