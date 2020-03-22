//
//  Subscript.swift
//  Subscripts
//
//  Created by Saleh Enam Shohag on 2/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

public class SubscriptTest {
    public func timesTable() {
        let threeTimesTable = TimesTable(multiplier: 3)
        print("Six times three is \(threeTimesTable[6])")
        var t = TestSubscrip(str: "initial")
        t["h"] = "new Value"
        print("appended value is: \(t["h"])")
    }
    
    public func dictionaryNullValueCheck() {
        var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        numberOfLegs["bird"] = 2
        let value = numberOfLegs["fdfd"]
        print("value: \(value ?? 10)")
        numberOfLegs["h"] = nil
        print("h legs: \(numberOfLegs["h"] ?? 3)")
    }
    
    public func matrix() {
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0, 1] = 1.5
        matrix[1, 0] = 3.2
        
        for i  in 0..<2 {
            for j in 0..<2 {
                print("\(matrix[i, j]) ", terminator:"")
            }
            print()
        }
    }
    
    func typeSubscripts() {
        if let mars = Planet[4] {
            print(mars)
        }
    }
}

//MARK:- Subscript Syntax

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

struct TestSubscrip {
    var str: String
    subscript(index: String) -> String {
        get{
            print("index: \(index)")
            return str
        }
        set {
            str = str + newValue
        }
    }
}

//MARK:- Subscript Options

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, columnn: Int) -> Bool {
        return row >= 0 && row < rows && columnn >= 0 && columnn < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, columnn: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, columnn: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
        
    }
    
   
}

//MARK:- Type Subscripts
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet? {
        return Planet(rawValue: n)
    }
}
