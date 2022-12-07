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
                    phrases: ["random \(.applicationName)"])
    }
}
