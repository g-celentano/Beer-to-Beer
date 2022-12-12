//
//  SuggestRandomBeerShortcutProvider.swift
//  beerToBeer
//
//  Created by Bruno De Vivo on 07/12/22.
//

import Foundation
import AppIntents

struct SuggestRandomBeerShortcutsProvider: AppShortcutsProvider{
    static var appShortcuts: [AppShortcut]{
        AppShortcut(intent: SuggestRandomBeer(),
                    phrases: ["Pick a random beer with \(.applicationName)",
                              "Suggest me a beer with \(.applicationName)",
                              "Propose me something \(.applicationName)",
                              "Tell me a beer \(.applicationName)",
                              "A random beer \(.applicationName)"])
    }
}
