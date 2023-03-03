//
//  SearchView.swift
//  SmartChef
//
//  Created by Enzo Kaniewska on 10.02.23.
//

import SwiftUI

struct SearchView: View {
    
    @State var textInput = ""
    @State var searchResults = [Ingredient]()
    @State var submit = false
    
    var didSelectItem: ((Ingredient)->Void)? = nil
    var body: some View {
        ScrollView{
            
            HStack {
                TextField("type in ingredient", text: $textInput)
                    .onChange(of: textInput) { newValue in
                        doSearch()
                    }
                    
                    
                Label("search", systemImage: "magnifyingglass")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.green)
                    .onTapGesture {
                        
                    }
            }
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.secondary, lineWidth: 0.3)
            }
            .padding(.horizontal)
    
            
            
            
            ForEach(searchResults){ ingredient in
                IngredientListItem(ingredient: ingredient) {
                    if didSelectItem != nil{
                        didSelectItem!(ingredient)
                    }
                }
            }
            
            Spacer()
            
            
        }
        .tint(.green)
    }
    
    func doSearch(){
        SmartChef.searchIngredients(searchInput: textInput) { result, error in
            if let result = result, error == nil{
                self.searchResults = result
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
