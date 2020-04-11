//
//  Collection.swift
//  Collection
//
//  Created by Saleh Enam Shohag on 11/4/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

//If we want to store our classes, structures in

class SetTest {
    public func set() {
        var strings: Set<String> = Set<String>()
        strings.insert("a")
        
        var motorCycles = Set<MotorCycle>()
        let motorCycle1 = MotorCycle(brandName: "Apache", licenseNo: "23-5367")
        let motorCycle2 = MotorCycle(brandName: "Apache", licenseNo: "23-5367")
        motorCycles.insert(motorCycle1)
        motorCycles.insert(motorCycle2) //this will not add as same value
        
        let motorCycle3 = MotorCycle(brandName: "Pulsar", licenseNo: "12-3456")
        motorCycles.insert(motorCycle3)
        if motorCycle1 == motorCycle2 {
            print("same")
        }
        if motorCycle1 === motorCycle2 {
            print("same ==== ")
        }
        
        for motoCyle in motorCycles {
            print(motoCyle.brandName)
        }
        
    }
}


class MotorCycle: Hashable {
    static func == (lhs: MotorCycle, rhs: MotorCycle) -> Bool {
        return lhs.brandName == rhs.brandName && lhs.licenseNo == rhs.licenseNo
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(brandName.hashValue / 17 + licenseNo.hashValue / 34)
    }
    
    var brandName: String
    var licenseNo: String?
    init(brandName: String, licenseNo: String) {
        self.brandName = brandName
        self.licenseNo = licenseNo
    }
    init(brandName: String) {
        self.brandName = brandName
    }
}
