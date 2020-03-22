//
//  Inheritence.swift
//  Inheritences
//
//  Created by Saleh Enam Shohag on 2/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

internal class Inheritence {
    
    func vehicle(){
        let someVehicle = Vehicle()
        print("Vehicle: \(someVehicle.description)")
        
        let train = Train()
        train.makeNoise()
    }
    
    func overrideProperty() {
        let limusine = Limusine()
        limusine.currentSpeed = 20
        print("Vehicle: \(limusine.description)")
        
        //Docs Example
        let car = Car()
        car.currentSpeed = 25.0
        car.gear = 3
        print("Car: \(car.description)")
    }
    
    func overridingProperyOverserver() {
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        print("AutomaticCar: \(automatic.description)")
    }
    
}

//MARK:- Defining a Base Class
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
        print("super \(#function)")
    }
}

//MARK:- Overriding Methods
class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("Child - Choo Choo")
    }
}


class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

///Own Example
class Limusine: Vehicle {
    override var currentSpeed: Double {
        get{return super.currentSpeed}
        set{
            super.currentSpeed = newValue
        }
    }
}


