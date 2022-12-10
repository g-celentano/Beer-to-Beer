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
    
    var body: some View {
        VStack{
            Text("All Beers")
                .font(.largeTitle)
                .foregroundColor(Color("30"))
                .fontWeight(.heavy)
                .frame(width: width * 0.9, alignment: .leading)

                //trying to put the selected item in the viewport
            
                    ScrollView{
                        ForEach(beerList, id:\.self){ beer in
                            ListElementView(beer: beer, localIdx: beerList.firstIndex(of: beer)!, activeIndex: $indexHandler)
                                
                            /*RoundedRectangle(cornerRadius: 10)
                                .frame(width: width * 0.95, height: height * 0.0025)
                                .foregroundColor(Color("30"))*/
                        }
                    }
                    .cornerRadius(10)
                    .padding()
                
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
