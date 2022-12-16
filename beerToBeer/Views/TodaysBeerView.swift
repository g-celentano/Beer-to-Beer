//
//  TodaysBeer.swift
//  beerToBeer
//
//  Created by Gaetano Celentano on 07/12/22.
//

import SwiftUI

//struct SpecialViewHeightKey: PreferenceKey {
//    static var defaultValue: CGFloat { 0 }
//    static func reduce(value: inout Value, nextValue: () -> Value) {
//        value = value + nextValue()
//    }
//}

struct TodaysBeerView: View {
    @State var beer : Beer
    @State private var fitInScreen = false
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
                            .offset(x: width * 0.06, y: width * 0.1)
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
                        
                        //GeometryReader{gr in
                            //ScrollView{
                                Text(beer.beerDesc)
                                .padding(.top, height*0.001)
                                .padding(.trailing)
                                .frame(width: width*0.5, alignment: .leading)
                                //.background(GeometryReader{Color.clear.preference(key: SpecialViewHeightKey.self, value: $0.frame(in: .local).size.height)})
                             //   .onPreferenceChange(SpecialViewHeightKey.self) {
                             //        self.fitInScreen = $0 < gr.size.height
                                //}
                            //}
                            //.scrollDisabled(self.fitInScreen)
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Today's Beer")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("30"))
         
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
