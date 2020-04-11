//
//  ARCTests.swift
//  ARCTests
//
//  Created by Saleh Enam Shohag on 22/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import XCTest
@testable import ARC

class ARCTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testarcInAction() {
        let a = ARCClass()
        a.arcInAction()
        
//        Timer.init(timeInterval: 0.9, repeats: false, block: {_ in
//            print("nothing")
//        })
    }
    
    func testcreateStrongReference() {
        let a = ARCClass()
        a.createStrongReference()
    }
    
    func testunOwned() {
        let a = ARCClass()
        a.unOwned()
        print("test complete")
    }
    
    func testStrongWeak() {
        let a = ARCClass()
        a.strongReference()
        a.weakReference()
        a.weakReferenceStrongNilFirst()
    }
    
    func testCosureStrongReference() {
        let a = ARCClass()
        a.strongReferenceCycleForClosure()
    }

}
