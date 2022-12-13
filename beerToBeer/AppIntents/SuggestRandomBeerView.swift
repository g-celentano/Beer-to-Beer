//
//  SuggestRandomBeerView.swift
//  beerToBeer
//
//  Created by Bruno De Vivo on 12/12/22.
//

import SwiftUI

struct SuggestRandomBeerView: View {
    var beer : Beer
    
    var body: some View {
        HStack{
            Image(beer.imageName)
                .resizable()
                .scaledToFit()
                .padding(.vertical)
                .frame(width: 80.0, height: 220.0)
            VStack(alignment: .leading){
                HStack{
                    Text("Name:")
                        .fontWeight(.semibold)
                    Text(beer.name)
                }
                HStack{
                    Text("Gradation:")
                        .fontWeight(.semibold)
                    Text(beer.grad)
                }
                HStack{
                    Text("Nationality:")
                        .fontWeight(.semibold)
                    Text(beer.nationality)
                }
            }
        }
    }
}

struct SuggestRandomBeerView_Previews: PreviewProvider {
    static var previews: some View {
        
        let beers : [Beer] = load("BeerList")
        
        SuggestRandomBeerView(beer: beers[0])
    }
}
