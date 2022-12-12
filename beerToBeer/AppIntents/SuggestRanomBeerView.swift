//
//  SuggestRanomBeerView.swift
//  beerToBeer
//
//  Created by Bruno De Vivo on 12/12/22.
//

import SwiftUI

struct SuggestRanomBeerView: View {
    
    var beer : BeerClass
    
    var body: some View {
        HStack {
            Image(beer.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical)
                    .frame(width: 80.0, height: 220.0)
            VStack(alignment: .leading){
                HStack {
                    Text("Name:")
                        .fontWeight(.semibold)
                    Text(beer.name)
                }
                HStack {
                    Text("Gradation:")
                        .fontWeight(.semibold)
                    Text(beer.grad)
                }
                HStack {
                    Text("Nationality:")
                        .fontWeight(.semibold)
                    Text(beer.nationality)
                }
            }
        }
    }
}

struct SuggestRanomBeerView_Previews: PreviewProvider {
    static var previews: some View {
        let beers : [BeerClass] = load("BeerList")
        
        SuggestRanomBeerView(beer: beers[0])
    }
}
