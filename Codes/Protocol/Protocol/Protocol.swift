//
//  Protocol.swift
//  Protocol
//
//  Created by Saleh Enam Shohag on 6/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

internal class Protocol{

    func swapTwoStrings(_ a: inout String, _ b: inout String) {
        let temporaryA = a
        a = b
        b = temporaryA
    }

}

//MARK:- Protocol Syntax

protocol FirstProtocol {
    // protocol definition goes here
}
protocol AnotherProtocol {
    // protocol definition goes here
    static var someTypeProperty: Int { get set }
}

struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
    static var someTypeProperty: Int {
        get{return 10}
        set{print(newValue)}
    }
}

class SomeSuperclass {
    
}

///If a class has a superclass, list the superclass name before any protocols it adopts
class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
    static var someTypeProperty: Int = 10
}


//MARK:- Property Requirements
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

struct Cannot: SomeProtocol {
    var mustBeSettable: Int {
        get{return 10}
        set{}
    }
    var doesNotNeedToBeSettable: Int
}

func test() {
    let canNot = Cannot(doesNotNeedToBeSettable: 89)
    print(canNot.mustBeSettable)
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")

class StarShip: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

let ncc1701 = StarShip(name: "Enterprise", prefix: "USS")

//MARK:- Mutating Method Requirements
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
//lightSwitch.toggle()

//MARK:- Mutating Method Requirements
protocol SomeProtocol2 {
    init(someParameter: Int)
}

class Someclass: SomeProtocol2 {
    required init(someParameter: Int) {
        
    }
}

//MARK:- Delegation
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

protocol DiceGame {
    var dice: Dice {get}
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakeAndLadders: DiceGame {
    let finalSquare = 25
    let dice: Dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRool = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRool)
            switch square + diceRool {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRool
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

//MARK:- Protocol Composition

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: String { get }
}

struct Person2: Named, Aged {
    var name: String
    var age: String
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Birthday, \(celebrator.name), you're \(celebrator.age)")
}
