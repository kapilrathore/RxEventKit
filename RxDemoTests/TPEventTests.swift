//
//  TPEventTests.swift
//  RxDemoTests
//
//  Created by kapilrathore-mbp on 03/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import XCTest
@testable import RxDemo

class TPEventTests: XCTestCase {
    
    var tpEvent: TPEvent!
    
    func test_TPEvent_is_invalid_if_title_is_empty() {
        // Setup
        tpEvent = TPEvent(title: "")
        
        // Assert
        XCTAssertEqual(tpEvent.isInvalid(), true)
    }
    
    func test_TPEvent_is_invalid_if_startDate_is_lessThan_currentDate() {
        // Setup
        tpEvent = TPEvent(title: "Test Title")
        tpEvent.startDate = Date().addingTimeInterval(-100)
        
        // Assert
        XCTAssertEqual(tpEvent.isInvalid(), true)
    }
    
    func test_TPEvent_is_invalid_if_endDate_is_lessThan_startDate() {
        // Setup
        tpEvent = TPEvent(title: "Test Title")
        tpEvent.startDate = Date().addingTimeInterval(100)
        tpEvent.endDate = Date().addingTimeInterval(50)
        
        // Assert
        XCTAssertEqual(tpEvent.isInvalid(), true)
    }
    
    func test_TPEvent_is_NOT_invalid() {
        // Setup
        tpEvent = TPEvent(title: "Test Title")
        tpEvent.startDate = Date().addingTimeInterval(100)
        tpEvent.endDate = Date().addingTimeInterval(150)
        
        // Assert
        XCTAssertEqual(tpEvent.isInvalid(), false)
    }

    override func tearDown() {
        tpEvent = nil
    }
}
