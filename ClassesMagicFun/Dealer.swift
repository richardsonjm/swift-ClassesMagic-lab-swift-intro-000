//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck: Deck
    var player: Player
    var house: House
    var winner: Player?
    var currentBet: UInt
    
    init() {
        self.deck = Deck()
        self.player = Player(name: "Player")
        self.house = House()
        self.currentBet = 0
    }
    
    
    func deal() {
        winner = nil
        player.hand.append(deck.drawCard()!)
        house.hand.append(deck.drawCard()!)
        player.hand.append(deck.drawCard()!)
        house.hand.append(deck.drawCard()!)
        if player.isBlackjack {
            winner = player
        } else if house.isBlackjack {
            winner = house
        }
    }
    
    func turn(_ player: Player) {
        while (!player.isBlackjack && player.willHit(currentBet)) {
            player.hand.append(deck.drawCard()!)
        }
    }
    
    func award() {
        if (winner?.name == "Player") {
            player.win(currentBet)
            house.lose(currentBet)
        } else if (winner?.name == "House"){
            house.win(currentBet)
            player.lose(currentBet)
        }
    }
}

//Create a deck property of type Deck to store the deck used to play the game.
//Create a player property of type Player to store the person who is playing the game.
//Create a house property of type House to store the house participating in the game.
//Create a winner property of type Player?. It should return the winner of the game if the game is over, or nil if the game is still in progress.
//Create an initializer that takes no parameters. It should create a new deck, a new player named "Player", and a House.
//Implement the method deal(). This will be the first deal of the game. The player should be dealt two cards, and the house should get two cards. If either player has blackjack (21), the winner property should be set to the winner of the game.
//Implement a turn(_:) method. This should take a single parameter, player, which is the Player whose turn should be taken. The player should be dealt cards until they decide to stay (take no more cards).
//Implement a method award(_:). This method should give the winner the current bet, and deduct the current from the losing player.
