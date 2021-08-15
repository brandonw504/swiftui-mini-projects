//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brandon Wong on 8/5/20.
//  Copyright © 2020 Brandon Wong. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = ["👻", "🎃", "💀", "🍬", "👿", "🕷", "🕸", "🍭", "🍫"]
        emojis.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

