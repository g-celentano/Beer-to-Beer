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
    var body: some View {
        ScrollView{
            ForEach(0..<3, id:\.self){ index in
                HStack{
                    Image("\(index)")
                        .scaleEffect(2)
                        .padding(.trailing)
                    VStack{
                        Text("\(names[index])")
                            .padding(.top, 0)
                        Spacer()
                    }
                        .font(fonts[index])
                    Spacer()
                }
                .padding()
                .frame(height: heights[index])
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.clear))
                .clipped()
                .onTapGesture {
                    withAnimation {
                        clicked = clicked == index ? -1 : index
                        if clicked != -1 {
                            fonts[clicked] = Font.largeTitle
                            heights[clicked] = height * 0.3
                            for i in 0..<fonts.count{
                                if i != clicked{
                                    fonts[i] = Font.title2
                                    heights[i] = height * 0.1
                                }
                            }
                        } else {
                            for i in 0..<fonts.count{
                                fonts[i] = Font.title2
                                heights[i] = height * 0.1
                            }
                        }
                    }
                }
                
               
            }
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
