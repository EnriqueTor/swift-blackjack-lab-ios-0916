//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var  dealer: Dealer?
    /**
     
     * Declare any custom properties here.
     
     */
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        var deck = Deck()
        deck.drawCard()
        
        
        //        Dealer.self
        //        Card.self
        //        Deck.self
        //        Player.self
        //        House.self
        
        /*
         
         * Call your custom classes here when running the scheme.
         
         */
        
        // Do not alter
        return true  //
    }   ///////////////
    
    func playBlackJack(withBet:UInt) {
        
        dealer!.place(bet: withBet)
        dealer!.deal()
        dealer!.turn(house:dealer!.player)
        dealer!.turn(house:dealer!.house)
        dealer!.winner()
        dealer!.award()
        dealer!.player.didWin(bet: withBet)
        dealer!.house.didWin(bet: withBet)
        dealer!.player.didLose(bet: withBet)
        dealer!.house.didLose(bet: withBet)
    }
    
    /*
     
     * Write your playBlackjack method in here
     
     */
    
}

