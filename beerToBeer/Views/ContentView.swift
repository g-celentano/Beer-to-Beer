//
//  ContentView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI

let beerList: [BeerClass] = load("BeerList")

struct ContentView: View {
    
    var body: some View {
        VStack {
            TabView{
                ListView()
                    .tabItem{
                        Label("List", systemImage: "book")
                    }
                TodaysBeer(beer: beerList.randomElement() ?? BeerClass())
                    .tabItem {
                        Label("Today's Beer", systemImage: "sun.and.horizon")
                    }
                
            }
            .accentColor(Color("30"))
        }
        .padding()
        .background(Color("60"))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
