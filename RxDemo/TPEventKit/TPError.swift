//
//  TPError.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 03/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Foundation

enum TPError: Error {
    case invalidEvent
    case permissionDenied
    case errorOnSave(reason: String)
}

extension TPError: Equatable {
    static func == (lhs: TPError, rhs: TPError) -> Bool {
        switch (lhs, rhs) {
        case (invalidEvent, invalidEvent):
            return true
            
        case (permissionDenied, permissionDenied):
            return true
            
        case let (errorOnSave(lhsReason), errorOnSave(rhsReason)):
            return lhsReason == rhsReason
            
        default:
            return false
        }
    }
    
}
