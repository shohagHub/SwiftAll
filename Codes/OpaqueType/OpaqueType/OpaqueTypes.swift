//
//  OpaqueTypes.swift
//  OpaqueType
//
//  Created by Saleh Enam Shohag on 10/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

public class OpaqueTypes {
    
}

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
    }
}
