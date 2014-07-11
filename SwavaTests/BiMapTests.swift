//
//  BiMapTests.swift
//  Swava
//
//  Created by pohl on 7/4/14.
//  Copyright (c) 2014 pohl. All rights reserved.
//

import XCTest
import Swava

class BiMapTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // setup code here. called prior to each test
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSimpleMapBehavior() {
        var b = BiMap<String,String>()
        
        b.put("A", value: ".-")
        b.put("B", value: "-...")
        b.put("C", value: "-.-.")
        b.put("D", value: "-..")
        b.put("E", value: ".")
        b.put("F", value: "..-.")
        
        XCTAssert(b["A"] == ".-", "dit dah expected")
        XCTAssert(b["B"] == "-...", "dah dit dit dit expected")
        XCTAssert(b["C"] == "-.-.", "dah dit dah dit expected")
        XCTAssert(b["D"] == "-..", "dah dit dit expected")
        XCTAssert(b["E"] == ".", "dit expected")
        XCTAssert(b["F"] == "..-.", "dit dit dah dit expected")
        
        XCTAssert(b.keyFor(".-") == "A", "A expected")
        XCTAssert(b.keyFor("-...") == "B", "B expected")
        XCTAssert(b.keyFor("-.-.") == "C", "C expected")
        XCTAssert(b.keyFor("-..") == "D", "D expected")
        XCTAssert(b.keyFor(".") == "E", "E expected")
        XCTAssert(b.keyFor("..-.") == "F", "F expected")
    }

    func testReplacingExistingValues() {
        var b = BiMap<String,Int>()
        b.put("A", value: 1)
        b.put("B", value: 2)
        XCTAssert(b["A"] == 1, "1 expected")
        XCTAssert(b["B"] == 2, "2 expected")
        XCTAssert(b.keyFor(1) == "A", "A expected")
        XCTAssert(b.keyFor(2) == "B", "B expected")

        b.put("A", value: 2)
        XCTAssert(b["A"] == 2, "2 expected after change")
        XCTAssert(b.keyFor(2) == "A", "A expected after change")
        XCTAssert(b["B"] == nil, "nil expected after change")
        XCTAssert(b.keyFor(1) == nil, "nil expected after change")
    }
    
    func testEquality() {
        var a = BiMap<Int,String>()
        var b = BiMap<Int,String>()
        XCTAssert(a == b, "a and be are both empty")
        a.put(1, value: "foo")
        XCTAssert(a != b, "expected inequality")
        a.put(2, value: "bar")
        XCTAssert(a != b, "expected inequality")
        b.put(2, value: "bar");
        XCTAssert(a != b, "expected inequality")
        b.put(1, value: "foo")
        XCTAssert(a == b, "expected equality")
        b.put(2, value: "foo");
        XCTAssert(a != b, "expected inequality")
        a.removeKeyForValue("bar");
        XCTAssert(a != b, "expected inequality")
        a.removeValueForKey(1)
        XCTAssert(a != b, "expected inequality")
        a.put(2, value: "foo");
        XCTAssert(a == b, "expected equality")
    }


    
}
