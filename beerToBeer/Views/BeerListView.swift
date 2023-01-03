//
//  ListView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI
let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height


struct BeerListView: View {
    @State var indexHandler = -1
    @State var searchValue = ""
    @State var searchBarHeight = 0.0
    
    
    var body: some View {
        
        NavigationStack{
            VStack{
                //BeerSearchBarView(searchValue: $searchValue)
                ScrollViewReader{ reader in
                    ScrollView{
                        ForEach(beerList.filter({ beer in
                            beer.hasPrefix(searchValue) || searchValue.isEmpty }), id:\.self){ beer in
                            BeerListElementView(beer: beer, localIdx: beerList.firstIndex(of: beer)!, activeIndex: $indexHandler)
                                .id(beerList.firstIndex(of: beer)!)
                                .onChange(of: indexHandler) { newValue in
                                    withAnimation{
                                        reader.scrollTo(indexHandler)
                                    }
                                }
                        }
                        
                    }
                    .cornerRadius(10)
                    .padding()
                    
                    
                }
                    
            }
            .frame(maxWidth: .infinity)
            .background(Color("60"))
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("All Beers")
                        .font(.largeTitle)
                        .foregroundColor(Color("30"))
                        .fontWeight(.heavy)
                }
            }
        }
        .searchable(text: $searchValue)

    }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
