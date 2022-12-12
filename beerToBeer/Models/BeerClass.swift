//
//  BeerClass.swift
//  beerToBeer
//
//  Created by Letterio Ugo Cangiano on 07/12/22.
//

import Foundation

struct BeerClass : Codable, Hashable {
    var imageName: String
    var name: String
    var grad: String
    var type: String
    var nationality: String
    var beerDesc: String
    
    
    init() {
        imageName = ""
        name = ""
        type = ""
        grad = ""
        nationality = ""
        beerDesc = ""
    }
    init(name : String,imageName: String, type: String, grad: String, nationality: String, beerDesc : String) {
        self.imageName = imageName
        self.name = name
        self.type = type
        self.grad = grad
        self.nationality = nationality
        self.beerDesc = beerDesc
    }
    
    func hasPrefix(_ prefix: String) -> Bool {
        return name.hasPrefix(prefix)
    }
    
}


