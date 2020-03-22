//
//  Deinitialization.swift
//  Deinitialization
//
//  Created by Saleh Enam Shohag on 3/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

class Deinitialization {
    func bankAndPlayer() {
        var playerOne: Player? = Player(coins: 100)
        print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
        
        print("There are now \(Bank.coinsInBank) coins left in the bank")
        // Prints "There are now 9900 coins left in the bank"
        
        playerOne!.win(coins: 2_000)
        print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
        
        print("The bank now only has \(Bank.coinsInBank) coins left")
        
        playerOne = nil
        print("PlayerOne has left the game")
        // Prints "PlayerOne has left the game"
        print("The bank now has \(Bank.coinsInBank) coins")
    }
}

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

