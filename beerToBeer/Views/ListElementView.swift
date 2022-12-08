//
//  ListElementView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI

struct ListElementView: View {
    @State var beer : BeerClass
    @State var localIdx : Int
    @Binding var activeIndex : Int
    
    //@State var font = Font.title2
    //@State var localHeight = height * 0.1
    //@State var iconRotation = 0.0
    @State var clicked = false
    
    var body: some View {
        HStack{
            Image(beer.imageName)
                .scaleEffect(clicked && localIdx == activeIndex ? width * 0.00075 : width * 0.001)
                .frame(width: width * 0.25)
                
                
            VStack{
                HStack{
                    Text(beer.name)
                        //.font(font)
                        .font(clicked && localIdx == activeIndex ? .largeTitle : .title2)
                        .fontWeight(.bold)
                        .frame(width: width*0.5, alignment: .leading)

                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: width * 0.1)
                        .scaleEffect(clicked && localIdx == activeIndex ? width * 0.004 : width * 0.003)
                        //.rotationEffect(.degrees(iconRotation))
                        .rotationEffect(.degrees(clicked && localIdx == activeIndex ? -90.0 : 0.0))
                        .padding(.trailing, width*0.02)
                        .padding(.top, clicked && localIdx == activeIndex ? height * 0.01 : height*0.002)
                    
                }
                .padding(.top, clicked && localIdx == activeIndex ? height * 0.01 : height * 0.02)
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
                .opacity(clicked && localIdx == activeIndex ? 1.0 : 0.0)
                .frame(height: clicked && localIdx == activeIndex ? height * 0.2 : 0)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        //.frame(width: width * 0.9, height: localHeight)
        .frame(width: width*0.9, height: clicked && localIdx == activeIndex ? height*0.3 : height*0.1)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("listElBG")))
        .foregroundColor(Color("60"))
        .clipped()
        .contentShape(Rectangle())
        /*.onChange(of: activeIndex, perform: { newValue in
            withAnimation{
                if newValue != localIndex {
                    clicked = false
                    font  = Font.title2
                    localHeight = height * 0.1
                    iconRotation = 0.0
                }
            }
        })*/
        .onTapGesture {
            withAnimation {
                clicked.toggle()
                if clicked {
                    if activeIndex != localIdx {
                        activeIndex = localIdx
                    } else {
                        activeIndex = -1
                    }
                } else {
                    activeIndex = -1
                }
            }
           //withAnimation {
                //clicked.toggle()
                //if clicked {
                    //if activeIndex != localIndex{
                        //activeIndex = localIndex
                    //font = Font.largeTitle
                    //localHeight = height * 0.3
                    //iconRotation = -90.0
                    //} else {
                        //font  = Font.title2
                        //localHeight = height * 0.1
                        //iconRotation = 0.0
                    //}
                    //
                //} else {
                    //activeIndex = -1
                    //font  = Font.title2
                    //localHeight = height * 0.1
                    //iconRotation = 0.0
                //}
            //}
       }
        
        
    }
}

struct ListElementView_Previews: PreviewProvider {
    static var previews: some View {
        ListElementView(beer: BeerClass(name: "Ciao mondo", imageName: "ichnusa", type: "tipo da due righe di merda cosi lunghe", grad: "gradi", nationality: "nazione", beerDesc: "Descrizione"), localIdx: 0, activeIndex: .constant(-1))
    }
}
