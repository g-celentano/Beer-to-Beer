//
//  ListElementView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI

struct BeerListElementView: View {
    @State var beer : Beer
    @State var localIdx : Int
    @Binding var activeIndex : Int
    
    @State var clicked = false
    
    var body: some View {
        HStack{
            Image(beer.imageName)
                .scaleEffect(localIdx == activeIndex ? width * 0.00075 : width * 0.001)
                .frame(width: width * 0.25)
                
            VStack{
                HStack{
                    Text(beer.name)
                        .font(localIdx == activeIndex ? .largeTitle : .title2)
                        .fontWeight(.bold)
                        .frame(height: height * 0.1, alignment: .leading)

                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: width * 0.1)
                        .scaleEffect(localIdx == activeIndex ? width * 0.004 : width * 0.003)
                        .rotationEffect(.degrees(localIdx == activeIndex ? -90.0 : 0.0))
                        .padding(.trailing, width*0.02)
                        .padding(.top, localIdx == activeIndex ? height * 0.01 : height*0.002)
                    
                }
                .padding(.top, localIdx == activeIndex ? height * 0.03 : height * 0.02)
                .frame(width: width * 0.65,height: height*0.1, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        Text("Alchool %: ")
                            .fontWeight(.semibold)
                        Text(beer.grad)
                    }
                    .frame(width: width*0.65, alignment: .leading)
                    .padding(.top, height * 0.01)
                    HStack{
                        Text("Type: ")
                            .fontWeight(.semibold)
                            .frame(height: height*0.05, alignment: .top)
                        Text(beer.type)
                            .padding(.trailing, width * 0.02)
                    }
                    .frame(width: width*0.65, alignment: .leading)
                    .padding(.top, height * 0.01)
                    HStack{
                        Text("Nationality: ")
                            .fontWeight(.semibold)
                        Text(beer.nationality)
                            
                    }
                    .frame(width: width*0.65, alignment: .leading)
                    .padding(.top, height * 0.01)
                    Spacer()
                }
                .frame(height:  localIdx == activeIndex ? height * 0.2 : 0)
                .opacity( localIdx == activeIndex ? 1.0 : 0.0)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        .frame(width: width*0.9, height:  localIdx == activeIndex ? height*0.3 : height*0.1)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("listElBG")))
        .foregroundColor(Color("60"))
        .clipped()
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            withAnimation {
                if activeIndex != localIdx {
                    activeIndex = localIdx
                } else {
                    activeIndex = -1
                }
            }
       }
        
        
    }
}

struct BeerListElement_Previews: PreviewProvider {
    static var previews: some View {
        BeerListElementView(beer: Beer(name: "Ciao mondo", imageName: "ichnusa", type: "tipo da due righe di merda cosi lunghe", grad: "gradi", nationality: "nazione", beerDesc: "Descrizione"), localIdx: 0, activeIndex: .constant(0))
    }
}
