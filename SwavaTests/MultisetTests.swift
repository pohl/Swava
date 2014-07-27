//
//  MultisetTests.swift
//  Swava
//
//  Created by pohl on 7/4/14.
//  Copyright (c) 2014 pohl. All rights reserved.
//

import XCTest
import Swava

class MultisetTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // setup code here. called prior to each test
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMultisetOfInts() {
        var setUnderTest = Multiset<Int>()
        setUnderTest.add(1)
        setUnderTest.add(2)
        setUnderTest.add(1)
        XCTAssert(setUnderTest[1] == 2, "two 1s expected")
        XCTAssert(setUnderTest[2] == 1, "one 2 expected")
        XCTAssert(setUnderTest[3] == nil, "zero 3s expected")
    }
    
    func testEquality() {
        var a = Multiset<Int>()
        var b = Multiset<Int>()
        XCTAssert(a == b, "a and be are both empty")
        a.add(1)
        XCTAssert(a != b, "expected inequality")
        a.add(2)
        XCTAssert(a != b, "expected inequality")
        a.add(1)
        XCTAssert(a != b, "expected inequality")
        b.add(1)
        XCTAssert(a != b, "expected inequality")
        b.add(2)
        XCTAssert(a != b, "expected inequality")
        b.add(1)
        XCTAssert(a == b, "expected equality")
    }

    
    
}
