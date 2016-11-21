//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    let deck: Deck
    let player: Player
    let house: House
    var currentBet: UInt
    var playerTurns: UInt
    var winningPlayer: Player?
    var winner: Player? {
        if let _ = winningPlayer {
            return winningPlayer
        }
        
        if playerTurns < 2 {
            return nil
        }
        
        if player.isBusted {
            return house
        }
        
        if house.isBusted {
            return player
        }
        
        if player.handValue > house.handValue {
            return player
        } else {
            return house
        }
    }
    
    init() {
        self.deck = Deck()
        self.player = Player(name: "Player")
        self.house = House()
        self.currentBet = 0
        self.playerTurns = 0
    }
    
    
    func deal() {
        player.hand.append(deck.drawCard()!)
        house.hand.append(deck.drawCard()!)
        player.hand.append(deck.drawCard()!)
        house.hand.append(deck.drawCard()!)
        if player.isBlackjack {
            winningPlayer = player
        } else if house.isBlackjack {
            winningPlayer = house
        }
    }
    
    func turn(player: Player) {
        while (!player.isBlackjack && player.willHit(currentBet) && deck.nextCard < 52) {
            player.hand.append(deck.drawCard()!)
        }
        playerTurns += 1
    }
    
    func award() {
        guard winner != nil else {
            return
        }
        winner!.win(currentBet)
        if (winner!.name == "Player") {
            house.lose(currentBet)
        } else {
            player.lose(currentBet)
        }
    }
    
    func placeBet(bet: UInt) -> Bool {
        if player.canPlaceBet(bet) && house.canPlaceBet(bet) {
            currentBet = bet
            return true
        } else {
            return false
        }
    }
}
