//
//  BeerClass.swift
//  beerToBeer
//
//  Created by Letterio Ugo Cangiano on 07/12/22.
//

import Foundation

struct BeerClass : Codable {
    var imageName: String
    var name: String
    var type: String
    var foodAdvice: String
    
    init() {
        imageName = ""
        name = ""
        type = ""
        foodAdvice = ""
    }
    
}


