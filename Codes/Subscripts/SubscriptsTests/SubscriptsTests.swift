//
//  SubscriptsTests.swift
//  SubscriptsTests
//
//  Created by Saleh Enam Shohag on 2/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import XCTest
@testable import Subscripts

class SubscriptsTests: XCTestCase {

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
    
    func testTimesTable() {
        let t = SubscriptTest()
        t.timesTable()
    }
    
    func testDictionaryNullValueCheck() {
        let t = SubscriptTest()
        t.dictionaryNullValueCheck()
    }
    
    func testMatrix(){
        let t = SubscriptTest()
        t.matrix()
        //matrix
    }
    
    func testTypeSubscripts() {
//        typeSubscripts
        let t = SubscriptTest()
        t.typeSubscripts()
    }

}
