//
//  SearchBar.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 12/12/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchValue: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .padding(.leading)
            TextField("Search...", text: $searchValue)
                .tint(Color("30"))
                .keyboardType(UIKeyboardType.default)
                
        }
        .frame(height: height*0.04)
        .background(Color("listElBG"))
        .cornerRadius(10)
        .foregroundColor(Color("60"))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchValue: .constant(""))
    }
}
