//
//  SearchBar.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 12/12/22.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct SearchBar: View {
    
    @Binding var searchValue: String
    
    var body: some View {
        
        HStack{
            Image(systemName: "magnifyingglass")
            TextField("", text: $searchValue)
                .placeholder(when: searchValue.isEmpty) {
                        Text("Search...").foregroundColor(.gray)
                }
            
            Spacer()
            Button{
                searchValue = ""
            } label:{
                Image(systemName: "x.circle.fill")
                    .opacity(searchValue.isEmpty ? 0.0 : 1.0)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: height*0.04)
        .background(Color("listElBG"))
        .cornerRadius(10)
        .tint(Color("30"))
        .foregroundColor(Color("60"))
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchValue: .constant(""))
    }
}
