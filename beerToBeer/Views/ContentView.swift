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
                Group{
                    ListView()
                        .tabItem{
                            Label("Beer List", systemImage: "book")
                        }
                    
                    TodaysBeer(beer: beerList.randomElement() ?? BeerClass())
                        .tabItem {
                            Label("Today's Beer", systemImage: "sun.and.horizon")
                        }
                        
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("60").opacity(0.1), for: .tabBar)
                    
                
            }
            .frame(width: width, height: height)
            .edgesIgnoringSafeArea(.leading)
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
