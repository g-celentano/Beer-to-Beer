//
//  BeerClass.swift
//  beerToBeer
//
//  Created by Letterio Ugo Cangiano on 07/12/22.
//

import Foundation

final class BeerClass : JSONSerialization {
    var imageName: String
    var name: String
    var type: String
    var foodAdvice: String
    
    init(beerName: String, beerImage: String, beerType: String, beerFoodAdvice: String) {
        imageName = beerImage
        name = beerName
        type = beerType
        foodAdvice = beerFoodAdvice
    }
}
