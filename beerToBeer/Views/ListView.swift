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
    var names = ["Ichnusa", "Poretti", "Peroni"]
    @State var fonts = [Font.title2, Font.title2, Font.title2]
    @State var clicked = -1
    @State var heights = [ height * 0.1,height * 0.1,height * 0.1]
    @State var indexHandler = -1
    
    var body: some View {
        VStack{
            Text("All Beers")
                .font(.largeTitle)
                .foregroundColor(Color("30"))
                .fontWeight(.heavy)
                .frame(width: width * 0.9, alignment: .leading)

            ScrollView{
                ForEach(0..<beerList.count, id:\.self){ index in
                    ListElementView(beer: beerList[index], activeIndex: $indexHandler, localIndex: index)
                    /*RoundedRectangle(cornerRadius: 10)
                        .frame(width: width * 0.95, height: height * 0.0025)
                        .foregroundColor(Color("30"))*/
                }
            }
            .frame(width: width*0.9)
            .padding()
        }
        .background(Color("60"))
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
