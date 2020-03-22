//
//  Method.swift
//  Methods
//
//  Created by Saleh Enam Shohag on 1/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

internal class MethodTest {
    func modifyingValueTypesFromWithinInstanceMethods() {
        var somePoint = Point(x: 1.0, y: 1.0)
        somePoint.moveBy(x: 2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        
        //Negative Test
        //let fixedPoint = Point(x: 3.0, y: 4.0)
        ///ERROR: Cannot use mutating member on immutable value: 'fixedPoint' is a 'let' constant
       //fixedPoint.moveBy(x: 2.0, y: 3.0)
    }
}

///Instance Method Type Method

//MARK:- Modifying Value Types from Within Instance Methods

struct Point {
    var x = 0.0, y = 0.0
    
    ///Error:
    ///Left side of mutating operator isn't mutable: 'self' is immutable
    ///Mark method 'mutating' to make 'self' mutable
//    func moveBy(x deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
    
    ///you need to declare it with mutatic
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
