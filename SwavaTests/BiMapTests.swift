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
        
        XCTAssert(b.keyFor(".") == "E", "E expected")
        XCTAssert(b.keyFor("-...") == "B", "B expected")
        XCTAssert(b.keyFor("-.-.") == "C", "C expected")
        XCTAssert(b.keyFor("-..") == "D", "D expected")
        XCTAssert(b.keyFor(".") == "E", "E expected")
        XCTAssert(b.keyFor("..-.") == "F", "F expected")
    }
    
    
}