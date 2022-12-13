//
//  SearchBar.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 12/12/22.
//

import SwiftUI

extension TextField {
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

struct BeerSearchBarView: View {
    
    @Binding var searchValue: String
    
    var body: some View {
        
        HStack{
            Image(systemName: "magnifyingglass")
            HStack{
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
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: width * 0.1)
        .background(Color("listElBG"))
        .cornerRadius(10)
        .tint(Color("30"))
        .foregroundColor(Color("60"))
        
    }
}

struct BeerSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        BeerSearchBarView(searchValue: .constant(""))
    }
}
