//
//  ListView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI
let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

//preference key for handling the scrollviewoffset
struct ScrollViewOffsetPreferenceKey: PreferenceKey {
  static var defaultValue = CGFloat.zero

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}


struct ListView: View {
    @State var indexHandler = -1
    @State var searchValue = ""
    @State var searchBarHeight = 0.0
    
    
    var body: some View {
        
        VStack{
            Text("All Beers")
                .font(.largeTitle)
                .foregroundColor(Color("30"))
                .fontWeight(.heavy)
                .frame(width: width * 0.9, alignment: .leading)
 
            ScrollViewReader{ reader in
                    ScrollView{
                        SearchBar(searchValue: $searchValue)
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
