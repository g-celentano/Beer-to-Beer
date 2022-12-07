//
//  ContentView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI

struct ContentView: View {
    
    let beerList: [BeerClass] = load("BeerList")
    
    var body: some View {
        VStack {
            TabView{
                ListView()
                    .tabItem{
                        Label("List", systemImage: "book")
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
