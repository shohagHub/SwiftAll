//
//  OptionalChainingTests.swift
//  OptionalChainingTests
//
//  Created by Saleh Enam Shohag on 3/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import XCTest
@testable import OptionalChaining

class OptionalChainingTests: XCTestCase {

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
    
    func testaltToForceUnwrap() {
        let c = OptionalChaining()
        c.altToForceUnwrap()
    }

    func testAccessingProperties() {
        let c = OptionalChaining()
        c.accessingProperties()
    }
    
    func testCallMethodsThroughOptionalChaining() {
        let c = OptionalChaining()
        c.callMethodsThroughOptionalChaining()
    }
    
    func testaccessingSubscripts() {
        let c = OptionalChaining()
        c.accessingSubscripts()
    }
    
    func testaccessSubscriptOptional() {
        let c = OptionalChaining()
        c.accessSubscriptOptional()
    }
    
    func testmultipleLevelOfLinking() {
        let c = OptionalChaining()
        c.multipleLevelOfLinking()
    }
    
    func testchainingOnMethod() {
        let c = OptionalChaining()
        c.chainingOnMethod()
    }
}
