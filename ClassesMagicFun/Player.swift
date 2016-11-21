//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    var name: String
    var wallet: UInt
    var hand: [Card]
    var handSize: Int {
        return hand.count
    }
    var handValue: UInt {
        var cardTotal = UInt(0)
        var aces = false
        for card in hand {
            cardTotal += card.value
            if (card.rank == "A") {
                aces = true
            }
        }
        if (aces && cardTotal <= 11) {
            return cardTotal + 10
        } else {
            return cardTotal
        }
    }
    
    var isBlackjack: Bool {
        return handValue == 21
    }
    
    var isBusted: Bool {
        return handValue > 21
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 100
        self.hand = []
    }
    
    func dealCard(card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return bet <= wallet
    }
    
    func willHit(bet: UInt) -> Bool {
        return canPlaceBet(bet) && handValue < 21
    }
    
    func win(amount: UInt) {
        wallet += amount
    }
    
    func lose(amount: UInt) {
        wallet -= amount
    }
}
