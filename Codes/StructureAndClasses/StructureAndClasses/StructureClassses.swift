//
//  StructureClassses.swift
//  StructureAndClasses
//
//  Created by Saleh Enam Shohag on 29/2/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

public class PublicClass {
    public init(){
        
    }
    public func publicMethod(){
        print(#function)
    }
}

///Structure Definition
struct Resolution: Equatable {
    var width = 0
    var height = 0
}

class VideoMode: Equatable {
    static func == (lhs: VideoMode, rhs: VideoMode) -> Bool {
        return lhs.resolution == rhs.resolution
    }
    
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

class StructureAndClassTest {
    public func structureAndClassInstance() {
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        print("The width of someResolution is \(someResolution.width)")
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
    }
    
    ///Memberwise Initializers for Structure Types
    public func membershipInitializer() {
        let vga = Resolution(width: 640, height: 480)
    }
    
    ///Structure and enumerations are value types
    ///value types
    public func valueTypes() {
        let hd = Resolution(width: 1920, height: 1080)
        var cinema  = hd
        cinema.width = 2048
        
        print("cinema is now \(cinema.width) pixels wide")
        print("hd is still \(hd.width) pixels wide")
    }
    enum CompassPoint {
        case north, sount, east, west
        mutating func turnNorth() {
            self = .north
        }
    }
    public func valueTypesEnum() {
        var currentDirection = CompassPoint.west
        var rememberedDirection = currentDirection
        currentDirection.turnNorth()
        
        print("The current direction is: \(currentDirection)")
        print("The remembered direction is: \(rememberedDirection)")
    }
    
    ///Classes are reference types
    public func referenceTypeClass() {
        let hd = Resolution(width: 1920, height: 1080)
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        
        if tenEighty === alsoTenEighty {
            print("two are equal")
        } else {
            print("two are not equal")
        }
        
        let anotherTenTwenty = VideoMode()
        anotherTenTwenty.resolution = hd
        anotherTenTwenty.interlaced = true
        anotherTenTwenty.name = "1080i"
        anotherTenTwenty.frameRate = 30.0
        
        if tenEighty == anotherTenTwenty {
            print("anotherTenTwenty ")
        } else {
            print("anotherTenTwenty is not same")
        }
    }
    
    public func identityOperator() {
        let hd = Resolution(width: 1920, height: 1080)
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        let alsoTenEighty = tenEighty
        
        let anotherTenEighty = VideoMode()
        anotherTenEighty.resolution = hd
        anotherTenEighty.interlaced = true
        anotherTenEighty.name = "1080i"
        anotherTenEighty.frameRate = 30.0
        
        ///idntity Operators
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        } else {
            print("tenEighty and alsoTenEighty does not refer to the same VideoMode instance.")
        }
        
        if tenEighty === anotherTenEighty {
            print("tenEighty and anotherTenEighty refer to the same VideoMode instance.")
        } else {
            print("tenEighty and anotherTenEighty does not refer to the same VideoMode instance.")
        }
        
        if tenEighty == anotherTenEighty {
            print("tenEighty and anotherTenEighty does not refer to the same VideoMode instance. but they are equal")
        } else {
            print("tenEighty and anotherTenEighty does not refer to the same VideoMode instance. and they are also not equal")
        }
    }
    
    func proveCollectionsAreValueTypes() {
        let dictionary1 = ["key": "value"]
        var dictionary2 = dictionary1
        dictionary2["key"] = "changed value"
        print("dictionary1: \(dictionary1) \ndictionary2: \(dictionary2)")
    }
}



//Create an example of Array and Dictionary Value type
