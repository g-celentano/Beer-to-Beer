//
//  TodaysBeer.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 07/12/22.
//

import SwiftUI

struct TodaysBeer: View {
    @State var beer : BeerClass
    var body: some View {
        VStack{
            Spacer()
            Text("Today's Beer")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("30"))
                .frame(width: width*0.9, alignment: .leading)
                
            
            
            HStack{
                Image(beer.imageName)
                    .scaleEffect(width*0.0016)
                    .rotationEffect(.degrees(15))
                    .frame(width: width * 0.38, height: height*0.3)
                    .padding(.trailing)
                    
                Spacer()
                VStack{
                    Text(beer.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: width*0.5, alignment: .leading)
                        .padding(.bottom)
                        .padding(.top, height * 0.1)
                    
                    HStack{
                        Text("Alchool %: ")
                            .fontWeight(.semibold)
                        Text(beer.grad)
                    }
                    .frame(width: width*0.5, alignment: .leading)
                    
                    HStack{
                        Text("Type: ")
                            .fontWeight(.semibold)
                        Text(beer.type)
                    }
                    .frame(width: width*0.5, alignment: .leading)
                    .padding(.top, height*0.001)
                    
                    ScrollView{
                        Text(beer.beerDesc)
                        .frame(width: width*0.5, alignment: .leading)
                        .padding(.top, height*0.001)
                        
                    }
                    
                }
                .foregroundColor(.white)
                .frame(height: height * 0.8, alignment: .top)
                
            }
            .frame(width: width)
            
            
        }
        .frame(width: width, height: height)
        .background(Color("60"))
        
        
    }
}

struct TodaysBeer_Previews: PreviewProvider {
    static var previews: some View {
        TodaysBeer(beer: BeerClass(name: "Birra", imageName: "peroni", type: "tipo", grad: "gradi", nationality: "nazione", beerDesc: "Descrizione"))
    }
}
