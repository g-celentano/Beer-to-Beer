//
//  ContentView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI

let beerList: [Beer] = load("BeerList")

struct ContentView: View {
    
    var body: some View {
            VStack {
                TabView{
                    BeerListView()
                        .tabItem{
                            Label("Beer List", systemImage: "book")
                        }
                    TodaysBeerView(beer: beerList.randomElement() ?? Beer())
                        .tabItem {
                            Label("Today's Beer", systemImage: "sun.and.horizon")
                        }
                }
                .frame(width: width)
                .accentColor(Color("30"))
            }
            .padding()
            .background(Color("60"))
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.bottom)
            .ignoresSafeArea(.keyboard)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
