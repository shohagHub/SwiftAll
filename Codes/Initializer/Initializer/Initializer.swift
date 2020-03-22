//
//  Initializer.swift
//  Initializer
//
//  Created by Saleh Enam Shohag on 2/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

class InitializerTest {
    
    func assignConstantPropertyDuringInitialization() {
        let beetsQuestion = SurveyQuestion(text: "How about beets?")
        beetsQuestion.ask()
        // Prints "How about beets?"
        beetsQuestion.response = "I also like beets. (But not with cheese.)"
        let s = Size(height: 2.0)
    }
    
    func test() {
        let t = Test(num: 50)
        t.test()
        let t2 = Test()
        t2.test()
    }
    
    func designatedAndConvinience() {
        let namedMeat = Food(name: "Bacon")
        // namedMeat's name is "Bacon"
        let mysteryMeat = Food()
        // mysteryMeat's name is "[Unnamed]"
        
        var breakFast = [
            ShoppingListItem(),
            ShoppingListItem(name: "Bacon"),
            ShoppingListItem(name: "Eggs", quantity: 6),
        ]
        
        breakFast[0].name = "Orange juice"
        breakFast[0].purchased = true
        
        for item in breakFast {
            print(item.descriptoin)
        }
    }
    
    func failableInit() {
        failable()
    }
    
    func rawAutofailureEnumInit(){
        rawAutofailureEnum()
    }
    
    func failablePropagationInit() {
        failablePropagation()
    }
    func requiredInit(){
        requiredInitializer()
    }
    
    
}
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

//MARK:- Assigning Constant Properties During Initialization
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}


//MARK:- Initializer Delegation for Value Types
struct Size {
    var width = 0.0
    var height: Double = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

class Abba {
    var property1: Int = 0
    init() {
        print("Abba")
    }
}

class Test: Abba {
    var number1: Int
    var cNum: Int {
        return 10
    }
    override init(){
        print("abba override")
        self.number1 = 100
    }
    init(num: Int) {
        self.number1 = num
        super.init()
        self.property1 = num
    }
    
    func test() {
        print("property1: \(property1)")
    }
}

//MARK:- Designated and Convenience Initializers in Action
class Food {
    var name: String
    //Designated Initializer
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
    //By Automatic Initializer rule 2:
    //Food's convinience init() is inherited in
    //ReceipeIngredient
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var descriptoin: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

func auto() {
    let oneMysteryItem = RecipeIngredient()
    let oneBacon = RecipeIngredient(name: "Bacon")
    let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
    
}


//MARK:- Failable Initializers
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

func failable() {
    let someCreature = Animal(species: "Giraffe")
    // someCreature is of type Animal?, not Animal

    if let giraffe = someCreature {
        print("An animal was initialized with a species of \(giraffe.species)")
    }
    
    let anonymousCreature = Animal(species: "")
    // anonymousCreature is of type Animal?, not Animal

    if anonymousCreature == nil {
        print("The anonymous creature could not be initialized")
    }
}
//MARK:- Failable Enum init
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

func failureEnum() {
    let fahrenheitUnit = TemperatureUnit(symbol: "F")
    if fahrenheitUnit != nil {
        print("This is a defined temperature unit, so initialization succeeded.")
    }
    // Prints "This is a defined temperature unit, so initialization succeeded."

    let unknownUnit = TemperatureUnit(symbol: "X")
    if unknownUnit == nil {
        print("This is not a defined temperature unit, so initialization failed.")
    }
    
}

//MARK:- Failable Initializers for Enumerations with Raw Values
enum TemperatureUnitRaw: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

func rawAutofailureEnum() {
    let fahrenheitUnit = TemperatureUnitRaw(rawValue: "F")
    if fahrenheitUnit != nil {
        print("This is a defined temperature unit, so initialization succeeded.")
    }
    
    let unknownUnit = TemperatureUnitRaw(rawValue: "X")
    if unknownUnit == nil {
        print("This is not a defined temperature unit, so initialization failed.")
    }
}

//MARK:- Propagation of Initialization Failure
class Product {
    let name: String
    init?(name: String){
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int){
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

func failablePropagation() {
    //Success
    if let twoSocks = CartItem(name: "sock", quantity: 2) {
        print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
    }
    
    //cartitem initialization fail as quantity is 0
    if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
        print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
    } else {
        print("Unable to initialize zero shirts")
    }
    
    //Superclass product initialization will fail as name is empty
    if let oneUnnamed = CartItem(name: "", quantity: 1) {
        print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
    } else {
        print("Unable to initialize one unnamed product")
    }
}


//MARK:- Overriding a Failable Initializer
class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        //A non-failable initializer cannot chain to failable initializer 'init(name:)' written with 'init?'
//        super.init(name: name)
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
    func getName() -> String {
        return self.name!
    }
}
//You can use forced unwrapping in an initializer to call a failable initializer
class UntiledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

func overridingFailable() {
    let auto = AutomaticallyNamedDocument(name: "")
    auto.getName()
}
//Required Initializers
///Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer:

class SomeClass {
    required init() {
        //initializer implementation goes here
        print("SomeClass")
    }
}
class SomeSubclass: SomeClass {
    var abc: Int
    init(abc: Int) {
        print("subclass \(#function)")
        self.abc = abc
    }
    
    required init() {
        //fatalError("init() has not been implemented")
        print("Sublass init()")
        self.abc = 2
    }
}

func requiredInitializer() {
    let s = SomeSubclass.init(abc: 1)
    print(s.abc)
    let s2 = SomeSubclass.init()
    print(s.abc)
}

