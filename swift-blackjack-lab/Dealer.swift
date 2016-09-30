//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Enrique Torrendell on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    
    var deck : Deck
    var house : House
    var player : House
    var bet : UInt
    
    init() {
        deck = Deck()
        house = House(name: "House")
        player = House(name: "Player")
        bet = 0
    }
    
    func place(bet:UInt) -> Bool {
        self.bet = bet
        return house.tokens > bet && player.tokens > bet
    }
    
    func deal() {
        deck.shuffle()
        player.cards = []
        house.cards = []
        house.stayed = false
        player.stayed = false
        let card = deck.remainingCards.last
        player.cards.append(card!)
        deck.dealtCards.append(card!)
        deck.remainingCards.removeLast()
        player.cards.append(card!)
        deck.dealtCards.append(card!)
        deck.remainingCards.removeLast()
        house.cards.append(card!)
        deck.dealtCards.append(card!)
        deck.remainingCards.removeLast()
        house.cards.append(card!)
        deck.dealtCards.append(card!)
        deck.remainingCards.removeLast()
    }
    
    func turn(house: House) {
        if house.mayHit {
            if house.mustHit {
                let card = deck.remainingCards.last
                house.cards.append(card!)
            }
            else {
                house.stayed = true
            }
        } else {
            house.stayed = true
        }
    }
    
    func winner() -> String {
        if player.blackjack {
            return "player"
        }
        if house.blackjack {
            return "house"
        }
        
        if player.busted {
            return "house"
        }
        
        if house.busted {
            return "player"
        }
        
        if player.stayed && house.stayed && player.handscore > house.handscore {
            return "player"
        }
        
        if player.stayed && house.stayed && house.handscore > player.handscore {
            return "house"
        }
        
        if player.handscore == house.handscore {
            return "house"
        }
        if player.cards.count == 5 && !player.busted {
            return "player"
        }
        if player.blackjack && house.blackjack {
            return "push"
        }
        else {
            return "no"
        }
    }
    
    func award() -> String {
        var message = ""
        if winner() == "player" {
            player.tokens += bet
            house.tokens -= bet
            message = "Player WINS!"
        }
        else if winner() == "house" {
            player.tokens -= bet
            house.tokens += bet
            message = "House WINS!"
        }
        else if winner() == "push" {
            message = "it is a tie"
        }
        else {
            message = "no Winner!"
        }
        return message
    }
}
