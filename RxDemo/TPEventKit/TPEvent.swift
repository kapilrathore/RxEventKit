//
//  TPEvent.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 03/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Foundation

struct TPEvent {
    var title: String
    
    var startDate: Date = Date()
    var endDate: Date = Date()
    var notes: String? = nil
    var url: URL? = nil
    var location: Location? = nil
    
    init(title: String) {
        self.title = title
    }
    
    func isInvalid() -> Bool {
        return title.isEmpty
            || startDate < Date()
            || endDate < startDate
    }
    
    struct Location: Equatable {
        let name: String
        let coordinates: (latitude: Double, longitude: Double)
        
        static func == (lhs: TPEvent.Location, rhs: TPEvent.Location) -> Bool {
            return lhs.name == rhs.name
                && lhs.coordinates == rhs.coordinates
        }
    }
}

extension TPEvent: Equatable {
    static func == (lhs: TPEvent, rhs: TPEvent) -> Bool {
        return lhs.title == rhs.title
            && lhs.startDate == rhs.startDate
            && lhs.endDate == rhs.endDate
            && lhs.notes == rhs.notes
            && lhs.url == rhs.url
            && lhs.location == rhs.location
    }
}
