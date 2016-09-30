//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Enrique Torrendell on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House : Player {
    
    override init (name: String) {
        super.init(name: name)
        tokens = 1000
    }
    
    var mustHit : Bool {
        return handscore < 17
    }
}
