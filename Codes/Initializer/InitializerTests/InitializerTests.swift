//
//  InitializerTests.swift
//  InitializerTests
//
//  Created by Saleh Enam Shohag on 2/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import XCTest
@testable import Initializer

class InitializerTests: XCTestCase {

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
    
    func testTest() {
        let i = InitializerTest()
        i.test()
    }
    
    func testDesignatedAndConvinience() {
        let i = InitializerTest()
        i.designatedAndConvinience()
    }
    
    func testFailableInit() {
        let i = InitializerTest()
        i.failableInit()
    }
    
    func testrawAutofailureEnumInit() {
        let i = InitializerTest()
        i.rawAutofailureEnumInit()
    }
    
    func testFailablePropagationInit() {
        let i = InitializerTest()
        i.failablePropagationInit()
    }
    
    func testrequiredInit() {
        let i = InitializerTest()
        i.requiredInit()
    }

}
