//
//  TPErrorTests.swift
//  RxDemoTests
//
//  Created by kapilrathore-mbp on 05/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import XCTest
@testable import RxDemo

// Testing (==) func of TPError
class TPErrorTests: XCTestCase {
    
    func test_equality() {
        XCTAssertEqual(TPError.invalidEvent, TPError.invalidEvent)
        XCTAssertEqual(TPError.permissionDenied, TPError.permissionDenied)
        
        let errorReason = "Test Error Reason"
        XCTAssertEqual(TPError.errorOnSave(reason: errorReason), TPError.errorOnSave(reason: errorReason))
    }
    
    func test_Inequality() {
        XCTAssertNotEqual(TPError.invalidEvent, TPError.permissionDenied)
        XCTAssertNotEqual(TPError.permissionDenied, TPError.invalidEvent)
        
        let errorReason = "Test Error Reason"
        XCTAssertNotEqual(TPError.errorOnSave(reason: ""), TPError.errorOnSave(reason: errorReason))
    }
}
