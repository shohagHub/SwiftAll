//
//  ARCClass.swift
//  ARC
//
//  Created by Saleh Enam Shohag on 22/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

public class ARCClass {
    public func arcInAction() {
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        reference1 = Person(name: "John Appleseed")
        reference2 = reference1
        reference3 = reference1
        
        reference1 = nil
        reference2 = nil
        reference3 = nil

    }
    
    public func createStrongReference() {
        var john: Person?
        var unit4A: Apartment?
        john = Person(name: "John Appleseeed")
        unit4A = Apartment(unit: "4A")
        
        john?.apartment = unit4A
        unit4A?.tenant = john
        
        john = nil
        unit4A = nil
        print("deinit does not called right??")
    }
    
    public func unOwned() {
        var john: Customer?
        
        john = Customer(name: "John Applessed")
//        var card: CreditCard? =
        john?.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
            //CreditCard(number: 1234_5678_9012_3456, customer: john!)
        
        //card?.number = 9873_2345_3456_9876
        if let no = john?.card?.number {
            print(no)
        } else {
            print("no no")
        }
//        john = nil
       // card = nil
        print("")
        john = nil
//        john?.card?.customer = nil
        
//
//        if let no = john?.card?.number {
//            print(no)
//        } else {
//            print("no no")
//        }
        print("all is nil now")
        
    }
    
    public func weakReference() {
        var john: Person?
        var unit4A: Apartment?
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")

        john!.apartment = unit4A
        unit4A!.tenant = john
        if let name = unit4A?.tenant?.name {
            print("in unit4a \(name) is live")
        }
        john = nil
        if let _ = unit4A?.tenant?.name {
            
        } else {
            print("only gosts live in unit4a now")
        }
        unit4A = nil
    }
    
    public func weakReferenceStrongNilFirst() {
        var john: Person?
        var unit4A: Apartment?
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")

        john!.apartment = unit4A
        unit4A!.tenant = john
        unit4A = nil
        john = nil
    }
    public func strongReference() {
        var john: PersonStrong?
        var unit4A: ApartmentStrong?
        john = PersonStrong(name: "John Appleseed")
        unit4A = ApartmentStrong(unit: "4A")

        john!.apartment = unit4A
        unit4A!.tenant = john
        john = nil
        unit4A = nil
        print("deinit will not be called")
    }
    
    func strongReferenceCycleForClosure() {
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        paragraph = nil
        print("is deinit called")
    }
}

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
class PersonStrong {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentStrong?
    deinit { print("\(name) is being deinitialized") }
}
class ApartmentStrong {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: PersonStrong?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    var number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being denitialized")
    }
}

//MARK:- Strong Reference Cycles for Closures

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self]
        () -> String in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
