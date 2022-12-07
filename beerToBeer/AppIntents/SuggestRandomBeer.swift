//
//  SuggestRandomBeer.swift
//  beerToBeer
//
//  Created by Bruno De Vivo on 07/12/22.
//

import Foundation
import AppIntents

struct SuggestRandomBeer: AppIntent{
    static var title: LocalizedStringResource = "Suggest a random beer"
    static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed
    
    func perform() async throws -> some IntentResult {
        return .result(dialog: "Ligma balls")
    }
}
