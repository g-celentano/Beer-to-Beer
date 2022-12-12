//
//  SuggestRandomBeerView.swift
//  beerToBeer
//
//  Created by Bruno De Vivo on 12/12/22.
//

import SwiftUI

struct SuggestRandomBeerView: View {
    var Beer : BeerClass
    
    var body: some View {
        HStack{
            Image(Beer.imageName)
                .resizable()
                .scaledToFit()
                .padding(.vertical)
                .frame(width: 80.0, height: 220.0)
            VStack(alignment: .leading){
                HStack{
                    Text("Name:")
                        .fontWeight(.semibold)
                    Text(Beer.name)
                }
                HStack{
                    Text("Gradation:")
                        .fontWeight(.semibold)
                    Text(Beer.grad)
                }
                HStack{
                    Text("Nationality:")
                        .fontWeight(.semibold)
                    Text(Beer.nationality)
                }
            }
        }
    }
}

struct SuggestRandomBeerView_Previews: PreviewProvider {
    static var previews: some View {
        
        let Beers : [BeerClass] = load("BeerList")
        
        SuggestRandomBeerView(Beer: Beers[0])
    }
}
