//
//  House.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    init() {
        super.init(name: "House")
    }
    
    override func willHit(_ amount: UInt) -> Bool {
        return handValue < 17
    }
}


//Create an initializer that takes no parameters. It should call super.init() (the Player superclass's initializer) with the player name of "House".
//    Override willHit(_:). Like its superclass's implementation, it takes one parameter, a UInt called bet. It should return true if the House's current hand value is below 17.
