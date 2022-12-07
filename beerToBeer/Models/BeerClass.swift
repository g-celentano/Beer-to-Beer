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
    var nationality: String
    var alcoholContent: String
    
    init() {
        imageName = ""
        name = ""
        type = ""
        nationality = ""
        alcoholContent = ""
    }
    
}


