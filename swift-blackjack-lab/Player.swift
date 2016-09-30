//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Enrique Torrendell on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    
    var name : String
    var cards : [Card]
    var handscore : UInt {
        return getHandscore()
    }
    
    var blackjack : Bool {
        return handscore == 21 && cards.count == 2
    }
    
    var busted : Bool {
        return handscore > 21
    }
    
    var stayed : Bool = false
    
    var mayHit : Bool {
        return !busted && !blackjack && !stayed
    }
    
    var tokens : UInt
    
    var description : String {
        return getDescription()
    }
    
    init(name: String) {
        self.name = name
        cards = []
        tokens = 100
    }
    
    private func getHandscore() -> UInt {
        var handscore: UInt = 0
        var acesCount: UInt = 0
        
        for card in cards {
            if card.rank != "A" {
                handscore += card.cardValue
            } else {
                acesCount += 1
            }
        }
        
        var aceScore = 11 * acesCount
        for _ in 0..<acesCount {
            if handscore + aceScore > 21 {
                aceScore -= 10
            }
        }
        return handscore + aceScore
    }
    
    private func getDescription() -> String {
        var stringCards = ""
        for card in cards {
            stringCards += "\(card.cardLabel) "
        }
        return "Player: \(name)\nCards: \(stringCards)\nHandscore: \(handscore)\nBlackJack:\(blackjack)\nBusted:\(busted)Stayed:\(stayed)\nTokens:\(tokens)"
    }
    
    
    func canPlace(bet:UInt) -> Bool {
        return tokens >= bet
    }
    
    func didWin(bet:UInt) {
        tokens += bet
    }
    
    func didLose(bet:UInt) {
        tokens -= bet
    }
    
}

