//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Enrique Torrendell on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    
    var remainingCards : [Card] = []
    var dealtCards : [Card] = []
    var description : String {
        return "Cards Remaining: \(remainingCards.count) Cards Dealt: \(dealtCards.count)"
    }
    
    init() {
        for suits in Card.validSuits() {
            for ranks in Card.validRanks() {
                remainingCards.append(Card(suit: suits, rank: ranks))
            }
        }
    }
    
    func drawCard () -> Card {
        let card = remainingCards.removeLast()
        print(card.cardLabel)
        dealtCards.append(card)
        return card
    }
    
    func shuffle() {
        var cardsToShuffle : [Card] = []
        remainingCards = []
        dealtCards = []
        for suits in Card.validSuits() {
            for ranks in Card.validRanks() {
                cardsToShuffle.append(Card(suit: suits, rank: ranks))
            }
        }
        for _ in cardsToShuffle {
            let randomIndex = Int(arc4random_uniform(UInt32(cardsToShuffle.count)))
            let card = cardsToShuffle[randomIndex]
            remainingCards.append(card)
            cardsToShuffle.remove(at: randomIndex)
        }
    }
}









