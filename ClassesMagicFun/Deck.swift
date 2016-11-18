//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card]
    
    init() {
        self.cards = []
        buildDeck()
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if(cards.count > 0) {
            return cards.removeFirst()
        } else {
            return nil
        }
    }
    
    func buildDeck() {
        for suit in ["♠️", "♣️", "♥️", "♦️"] {
            for rank in ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"] {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        shuffle()
    }
}

//
//Add a property of type [Card] called cards. This stores all the cards in the deck.
//Implement a shuffle() method that will shuffle the deck. (Note that a method called shuffleInPlace() has been implemented for you on Arrays. This method will shuffle the elements of a mutable array. You could, for example, call cards.shuffleInPlace() to shuffle the array of Cards.)
//Implement a drawCard() method. This method should return a value of type Card?. If there are cards left in the deck, it should return the next card; otherwise, it should return nil.
