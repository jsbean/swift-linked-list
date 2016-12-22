//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Jeremy Corren on 12/22/16.
//  Copyright © 2016 Jeremy Corren. All rights reserved.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {
    
    func testInit() {
        let _ = LinkedList<String>()
    }
    
    func testAppend() {
        
        let list = LinkedList<String>()
        list.append(value: "a")
        list.append(value: "b")
        
        XCTAssertEqual(list[0], "a")
        XCTAssertEqual(list[1], "b")
    }
    
    func testHeadAndTail() {
        
        let list = LinkedList<String>()
        list.append(value: "a")
        list.append(value: "b")
        list.append(value: "c")
        
        XCTAssertEqual(list.first!.value, "a")
        XCTAssertEqual(list.last!.value, "c")
    }
    
    func testNodeAt() {
        
        let list = LinkedList<String>()
        list.append(value: "a")
        list.append(value: "b")
        list.append(value: "c")
        list.append(value: "d")
        list.append(value: "e")
        
        XCTAssertEqual(list.nodeAt(1)!.value, "b")
        XCTAssertEqual(list.nodeAt(2)!.value, "c")
        XCTAssertEqual(list.nodeAt(3)!.value, "d")
    }
    
    func testInsert() {
        
        let list = LinkedList<String>()
        list.append(value: "a")
        list.append(value: "c")
        list.insert(value: "b", index: 1)
        
        XCTAssertEqual(list[1], "b")
    }
    
    func testInsertAtHeadAndTail() {
        
        let list = LinkedList<String>()
        list.insert(value: "a", index: 0)
        XCTAssertEqual(list[0], "a")
        
        list.insert(value: "b", index: 1)
        XCTAssertEqual(list[1], "b")
    }
    
    func testInsertTowardsEnd() {
        
        let list = LinkedList<String>()
        list.append(value: "a")
        list.append(value: "b")
        list.append(value: "c")
        list.append(value: "d")
        list.append(value: "f")
        
        list.insert(value: "e", index: 4)
    }
    
    func testRemoveHead() {
        
        let list = LinkedList<String>()
        list.append(value: "a")
        list.append(value: "b")
        let _ = list.remove(node: list.first!)
        
        XCTAssertEqual(list[0], "b")
    }
    
    func testRemoveTail() {
    
        let list = LinkedList<String>()
        list.append(value: "a")
        list.append(value: "b")
        let _ = list.remove(node: list.last!)
        
        XCTAssertEqual(list[1], nil)
    }
    
    func testRemoveAll() {
        
        let list = LinkedList<String>()
        list.append(value: "a")
        list.removeAll()
        
        XCTAssertEqual(list.count, 0)
    }
    
    func testCount() {
        
        let list = LinkedList<String>()
        XCTAssertEqual(list.tally, 0)
        
        list.append(value: "a")
        XCTAssertEqual(list.tally, 1)
        
        list.append(value: "c")
        XCTAssertEqual(list.tally, 2)
        
        list.insert(value: "b", index: 1)
        XCTAssertEqual(list.tally, 3)
        
        let _ = list.remove(node: list.nodeAt(2)!)
        XCTAssertEqual(list.tally, 2)
    }
}
