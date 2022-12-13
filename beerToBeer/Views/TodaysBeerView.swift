//
//  TodaysBeer.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 07/12/22.
//

import SwiftUI

struct TodaysBeerView: View {
    @State var beer : Beer
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    ZStack {
                        Image(beer.imageName)
                            .renderingMode(.template)
                            .scaleEffect(width*0.0016)
                            .rotationEffect(.degrees(15))
                            .frame(width: width * 0.38, height: height*0.3)
                            .padding(.trailing)
                            .opacity(0.2)
                            .blur(radius: 8.0)
                            .offset(x: 30.0, y: 30.0)
                            .foregroundColor(.black)
                        
                        Image(beer.imageName)
                            .scaleEffect(width*0.0016)
                            .rotationEffect(.degrees(15))
                            .frame(width: width * 0.38, height: height*0.3)
                            .padding(.trailing)
                    }
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
                        
                        //ScrollView{
                            Text(beer.beerDesc)
                            .frame(width: width*0.5, alignment: .leading)
                            .padding(.top, height*0.001)
                        //}
                        
                    }
                    .foregroundColor(.white)
                    .frame(maxHeight: .infinity, alignment: .top)
                    
                }
                .frame(width: width)
                Spacer()
                
                
            }
            .frame(width: width)
            .background(Color("60"))
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Today's Beer")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("30"))
                        .frame(width: width*0.9, alignment: .leading)
         
                }
            }
        }
        
        
    }
}

struct TodaysBeerView_Previews: PreviewProvider {
    static var previews: some View {
        TodaysBeerView(beer: Beer(name: "Birra", imageName: "peroni", type: "tipo", grad: "gradi", nationality: "nazione", beerDesc: "Descrizione"))
    }
}
