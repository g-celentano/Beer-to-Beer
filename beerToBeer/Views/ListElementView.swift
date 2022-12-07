//
//  ListElementView.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 06/12/22.
//

import SwiftUI

struct ListElementView: View {
    @State var beer : BeerClass
    @Binding var activeIndex : Int
    @State var localIndex : Int
    
    @State var font = Font.title2
    @State var localHeight = height * 0.1
    @State var clicked = false
    @State var iconRotation = 0.0
    var body: some View {
        HStack{
            Image(beer.imageName)
                .scaleEffect(clicked ? 2.2 : 2)
                .padding(.trailing)
                .padding(.leading)
            VStack{
                HStack{
                    Text(beer.name)
                        .font(font)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .scaleEffect(width * 0.0035)
                        .rotationEffect(.degrees(iconRotation))
                        .padding(.trailing, width*0.01)
                }
                .padding(.top, clicked ? height * 0.01 : height * 0.02)
                .frame(width: width * 0.7, alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        Text("Gradation: ")
                            .fontWeight(.semibold)
                        Text(beer.grad)
                    }
                    .frame(width: width*0.65, alignment: .leading)
                    .padding(.top, height * 0.01)
                    HStack{
                        Text("Type: ")
                            .fontWeight(.semibold)
                        Text(beer.type)
                    }
                    .frame(width: width*0.65, alignment: .leading)
                    .padding(.top, height * 0.01)
                    HStack{
                        Text("Food Advice: ")
                            .fontWeight(.semibold)
                        Text(beer.foodAdvice)
                            
                    }
                    .frame(width: width*0.65, alignment: .leading)
                    .padding(.top, height * 0.01)
                    Spacer()
                }
                .opacity(clicked ? 1.0 : 0.0)
                .frame(height: clicked ? height * 0.2 : 0)
                Spacer()
            }
                
            Spacer()
        }
        .padding()
        .frame(width: width * 0.9, height: localHeight)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("listElBG")))
        //.foregroundColor(Color("personalRed"))
        .foregroundColor(Color("60"))
        .clipped()
        .onChange(of: activeIndex, perform: { newValue in
            withAnimation{
                if newValue != localIndex {
                    clicked = false
                    font  = Font.title2
                    localHeight = height * 0.1
                    iconRotation = 0.0
                }
            }
        })
        .onTapGesture {
            withAnimation {
                if activeIndex != localIndex {
                    activeIndex = localIndex
                    clicked = true
                    font = Font.largeTitle
                    localHeight = height * 0.3
                    iconRotation = -90.0
                    
                } else {
                    activeIndex = -1
                    clicked = false
                    font  = Font.title2
                    localHeight = height * 0.1
                    iconRotation = 0.0
                }
            }
        }
        
    }
}

struct ListElementView_Previews: PreviewProvider {
    static var previews: some View {
        ListElementView(beer: BeerClass(name: "Ciao mondo", imageName: "0", type: "tipo", grad: "gradi", foodAdvice: "cibo", beerDesc: "Descrizione"), activeIndex: .constant(-1), localIndex: 0)
    }
}
