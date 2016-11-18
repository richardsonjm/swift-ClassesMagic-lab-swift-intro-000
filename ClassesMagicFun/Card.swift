//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit: String
    var rank: String
    var label: String {
        return suit + rank
    }
    var value: Int {
        switch rank {
        case "J", "Q", "K":
            return 10
        case "A":
            return 1
        default:
            return Int(rank)!
        }
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
    
}


//A String property called suit that holds the card's suit: Either ♠️, ♣️, ♥️, or ♦️.
//A String property called rank that holds the card's rank: Either "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", or "K".
//A String property called label that returns a string representing both the rank and the suit. For example, the ace of spade's label would return "A♠️".
//A value property that returns the value of the card. Numbered cards are worth their face value, face cards are worth 10, and aces are worth 1. (Aces can be worth 11 at the player's discretion, but this property should return 1 for aces.)
//An initializer that takes the suit and rank as parameters.
