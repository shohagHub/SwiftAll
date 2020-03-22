//
//  PropertiesTests.swift
//  PropertiesTests
//
//  Created by Saleh Enam Shohag on 29/2/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import XCTest
@testable import Properties

class PropertiesTests: XCTestCase {

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
    
    func testLazyStored() {
        let p = PropertiesTest()
        p.lazyStoredProperties()
    }
    
    func testReadOnlyComputedProperty() {
        let p = PropertiesTest()
        p.readOnlyComputedProperty()
    }
    
    func testPropertyOvserverComputedInChildClass(){
        let p = PropertiesTest()
        p.propertyOvserverComputedInChildClass()
    }
    //propertyOvserverStoredProperyChildClass
    func testPropertyOvserverStoredProperyChildClass() {
        let p = PropertiesTest()
        p.propertyOvserverStoredProperyChildClass()
    }
    //plainPropertyObserver
    func testPlainPropertyObserver() {
        let p = PropertiesTest()
        p.plainPropertyObserver()
    }
    func testPropertyWrapper() {
        let p = PropertiesTest()
        p.propertyWrapper()
    }
    //initialValuesForPropertyWrapper
    func testInitialValuesForPropertyWrapper() {
        let p = PropertiesTest()
        p.initialValuesForPropertyWrapper()
    }
    //projectingValueFromProperyWrapper
    func testProjectingValueFromProperyWrapper() {
        let p = PropertiesTest()
        p.projectingValueFromProperyWrapper()
    }
}
