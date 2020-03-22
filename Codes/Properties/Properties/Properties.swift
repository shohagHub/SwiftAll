//
//  Properties.swift
//  Properties
//
//  Created by Saleh Enam Shohag on 29/2/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

public class PropertiesTest {
    func testFixedStruct() {
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        rangeOfThreeItems.firstValue = 6
    }
    func storedPropertiesOfConstantStructureInstances() {
        let rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        //Cannot assign to property: 'rangeOfThreeItems' is a 'let' constant
//        rangeOfThreeItems.firstValue = 6
        //The same is not true for classes
    }
    
    ///Lazy Stored Properties
    func lazyStoredProperties() {
        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        print("heya") //check the debugger importer instance is not created
//        if manager.importer == nil {
//            print("it is true")
//        }
        print(manager.importer.filename)
        print("hmm")
    }
    
    func computedProperty() {
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        
    }
    func readOnlyComputedProperty() {
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
        //Cannot assign to property: 'volume' is a get-only property
        //        fourByFiveByTwo.volume = 10.0
    }
    
    func propertyOvserverComputedInChildClass() {
        let child = ChildComputed(size: Size(width: 10, height: 10))
        child.center = Point(x: 15.0, y: 15.0)
    }
    
    func propertyOvserverStoredProperyChildClass() {
        let child = ChildComputed(size: Size(width: 10, height: 10))
        child.size = Size(width: 20, height: 20)
    }
    func plainPropertyObserver(){
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // About to set totalSteps to 200
        // Added 200 steps
        stepCounter.totalSteps = 360
        // About to set totalSteps to 360
        // Added 160 steps
        stepCounter.totalSteps = 896
        // About to set totalSteps to 896
        // Added 536 steps
    }
    
    func propertyWrapper() {
        var rectangle = SmallRectangle()
        print(rectangle.height)
        // Prints "0"

        rectangle.height = 10
        print(rectangle.height)
        // Prints "10"

        rectangle.height = 24
        print(rectangle.height)
    }
    
    func initialValuesForPropertyWrapper() {
//        var zeroRectangle = ZeroRectangle()
//        print(zeroRectangle.height, zeroRectangle.width)
//        // Prints "0 0"
//        
//        var unitRectangle = UnitRectangle()
//        print(unitRectangle.height, unitRectangle.width)
        // Prints "1 1"
        
//        var narrowRectangle = NarrowRectangle()
//        print(narrowRectangle.height, narrowRectangle.width)
//        // Prints "2 3"
//
//        narrowRectangle.height = 100
//        narrowRectangle.width = 100
//        print(narrowRectangle.height, narrowRectangle.width)
        // Prints "5 4"
    }
    
    func projectingValueFromProperyWrapper() {
        var someStructure = SomeStructureProjected()

        someStructure.someNumber = 4
        print(someStructure.$someNumber)
        // Prints "false"

        someStructure.someNumber = 55
        print(someStructure.$someNumber)
        // Prints "true"
    }
    
    func audioChannel() {
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannels)
        
        rightChannel.currentLevel = 11
        print(rightChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannels)
    }
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}



struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


class Computed {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    init(size: Size) {
        self.size = size
    }
}

class ChildComputed: Computed {
    override var center: Point {
        willSet{
            print("center will be set \(newValue.x) \(newValue.y)")
        }
        didSet {
            print("old value: (\(oldValue.x) \(oldValue.y)), new value(\(center.x), \(center.y))")
        }
    }
    override var size: Size {
        willSet{
            print(#function)
            print("size will be set to h:\(newValue.height) w: \(newValue.width)")
        }
        didSet {
            print(#function)
            print("old size:(w:\(oldValue.width) h: \(oldValue.height)) new size: (h: \(size.height) w: \(size.width))")
        }
    }
    override init(size: Size) {
        super.init(size: size)
    }
    
}

//MARK:- ReadOnly computed Property
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        get{
            width * height * depth
        }
    }
}

//MARK:- Property Observers
///Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

//MARK:- Property Wrappers

@propertyWrapper
struct TwelveOrLess {
    private var number: Int
    init() {
        self.number = 0
    }
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

//MARK:- Setting Initial Values for Wrapped Properties
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get{ return number }
        set{ number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        self.number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

//struct ZeroRectangle {
//    @SmallNumber var height: Int
//    @SmallNumber var width: Int
//}

//struct UnitRectangle {
//    @SmallNumber var height: Int = 1
//    @SmallNumber(wrappedValue: 1) var width: Int
//}

//struct NarrowRectangle {
//    @SmallNumber(wrappedValue: 2, maximum: 5) var height
//    @SmallNumber(wrappedValue: 3, maximum: 4) var width
//
//}

@propertyWrapper
struct SmallNumberProjected {
    private var number: Int
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = false
    }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}

struct SomeStructureProjected {
    @SmallNumberProjected var someNumber: Int
}

enum SizeEnum {
    case small, large
}

struct SizedRectangle {
    @SmallNumberProjected var height: Int
    @SmallNumberProjected var width: Int
    
    mutating func resize(to size: SizeEnum) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 10
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

//MARK:- Type Properties
//MARK:- Type Property Syntax
struct SomeStructure {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some Value."
    
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

enum Types {case string, int}
enum Properties {
    var type: Types {
        return .int
    }
    case capa
}

//MARK:- AudioChannel

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
