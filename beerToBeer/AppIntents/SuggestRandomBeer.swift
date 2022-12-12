//
//  SuggestRandomBeer.swift
//  beerToBeer
//
//  Created by Bruno De Vivo on 07/12/22.
//

import Foundation
import AppIntents
import SwiftUI

struct SuggestRandomBeer: AppIntent{
    static var title: LocalizedStringResource = "Suggest a random beer"
    static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed
    
    func perform() async throws -> some ProvidesDialog & ShowsSnippetView {
        let beerList: [BeerClass] = load("BeerList")
        let tryTempBeer = beerList.randomElement()
        
        guard let tempBeer = tryTempBeer else{
            return .result(dialog: "I don't have any beer to suggest to you", view: EmptyView())
        }
        
        let Answers : [IntentDialog] = ["I suggest you \(tempBeer.name)",
                                        "I think \(tempBeer.name) could be suitable for you!",
                                        "Don't drink too \(tempBeer.name)!",
                                        "If you don't have to drive, \(tempBeer.name) is the right choice"]
        
        return .result(dialog: Answers.randomElement()!, view: SuggestRandomBeerView(Beer: tempBeer))
    }
}
