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
        // calculate value here
        return 5
    }
    var isBlackjack: Bool {
        if (handValue == 21) {
            return true
        } else {
            return false
        }
    }
    var isBusted: Bool {
        if (handValue > 21) {
            return true
        } else {
            return false
        }
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 100
        self.hand = []
    }
    
    func dealCard(_ card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(_ bet: UInt) -> Bool {
        return bet < wallet
    }
    
    func willHit(_ bet: UInt) -> Bool {
        return canPlaceBet(bet) && !isBusted
    }
    
    func win(_ amount: UInt) {
        wallet = wallet + amount
    }
    
    func lose(_ amount: UInt) {
        wallet = wallet - amount
    }
}


//A String property called name that will store the name of the player.
//A UInt property called wallet that will store how much money the player has.
//A [Card] property called hand that will store the player's hand.
//An Int property called handSize that will store the number of cards in the player's hand.
//A UInt property called handValue that will store the value of the player's hand. In Blackjack, numbered cards are worth the numerical value of the card, face cards are worth 10 points, and aces can be worth 1 or 11 at the player's discretion. Aces are a bit tricky, so you will have to implement some logic to decide if the ace should be worth 1 or 11. (If it makes your implementation simpler, you can assume the player will hold no more than one ace at a time, although this is not guaranteed.)
//A Bool property called isBlackjack that determines if the player's hand value is 21.
//A Bool property called isBusted if the player's hand value is over 21.
//An initializer that takes a single parameter, the name of the player. It should assign this value to the name property.
//A method called dealCard(_:). This method takes one card as a parameter and adds it to the player's hand.
//A method called canPlaceBet(_:). This method takes one paramter, the current bet as a UInt. This returns true if the bet is less than the player's wallet.
//A method called willHit(_:). This method takes one parameter, a UInt representing the current bet, and returns true if the player will take another card. This player is a bit foolhardy and will take another card if they can afford the bet and their hand size is below 21.
//A method called win(_:). This method takes one parameter, a UInt, that represents the amount the player has won. It should update the wallet property accordingly.
//A method called lose(_:). This method takes one parameter, a UInt, that represents the amount the player has lost. It should update the wallet property accordingly.
