//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Enrique Torrendell on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    var suit : String
    var rank : String
    var cardLabel : String
    var cardValue : UInt
    
    init(suit: String, rank: String){
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(suit)\(rank)"
        cardValue = Card.determineCardValue(card: rank)
    }
    
    static func validSuits() -> [String] {
        return ["♠","♥","♦","♣"]
    }
    
    static func validRanks() -> [String] {
        return ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    }
    
    static func determineCardValue(card: String) -> UInt {
        var value : UInt = 0
        switch (card) {
        case "A":
            value = 1
        case "2","3","4","5","6","7","8","9","10":
            value = UInt(card)!
        case "J","Q","K":
            value = 10
        default: break
        }
        return value
    }
}

func descriptionFor(cardArray:Card) -> String {
    var info = ""
    for suits in Card.validSuits() {
        for ranks in Card.validRanks() {
            info.append(suits+ranks+"\n")
        }
    }
    return info
}
