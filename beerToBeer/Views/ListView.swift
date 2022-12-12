//
//  ListView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI
let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height


struct ListView: View {
    @State var indexHandler = -1
    @State var searchValue = ""
    @State var beerSearch : [BeerClass] = []
    
    
    var body: some View {
        VStack{
            Text("All Beers")
                .font(.largeTitle)
                .foregroundColor(Color("30"))
                .fontWeight(.heavy)
                .frame(width: width * 0.9, alignment: .leading)

            
            ScrollViewReader{ reader in
                ScrollView{
                    /*HStack{
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        TextField("Search...", text: $searchValue)
                            .tint(Color("30"))
                            .keyboardType(UIKeyboardType.default)
                            .onSubmit {
                                beerSearch = beerList.filter { beer in
                                    beer.name == searchValue
                                }
                            }
                            
                    }
                    .frame(height: height*0.04)
                    .background(Color("listElBG"))
                    .cornerRadius(10)
                    .foregroundColor(Color("60"))*/
                    SearchBar(searchValue: $searchValue)
                    .id(-2)
                    
                    ForEach(beerList.filter({ beer in
                        beer.hasPrefix(searchValue) || searchValue.isEmpty
                    }), id:\.self){ beer in
                        ListElementView(beer: beer, localIdx: beerList.firstIndex(of: beer)!, activeIndex: $indexHandler)
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
                .onAppear{
                    reader.scrollTo(0)
                    
                }
            }
                
        }
        .frame(maxWidth: .infinity)
        .background(Color("60"))
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
