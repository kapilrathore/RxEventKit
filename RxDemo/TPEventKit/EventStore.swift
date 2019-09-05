//
//  EventStore.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 04/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Foundation
import EventKit

protocol EventStore {
    var defaultCalendar: EKCalendar? { get }
    var isPermissionGranted: Bool { get }
    
    func save(_ event: TPEvent) throws
    func requestAccess(completion: @escaping (Bool, Error?) -> Void)
}

extension EKEventStore: EventStore {
    func save(_ event: TPEvent) throws {
        let ekEvent = getEKEvent(from: event)
        try save(ekEvent, span: .thisEvent)
    }
    
    var defaultCalendar: EKCalendar? {
        return defaultCalendarForNewEvents
    }
    
    var isPermissionGranted: Bool {
        return EKEventStore.authorizationStatus(for: .event) == .authorized
    }
    
    func requestAccess(completion: @escaping (Bool, Error?) -> Void) {
        return self.requestAccess(to: .event) { completion($0, $1) }
    }
    
    private func getEKEvent(from event: TPEvent) -> EKEvent {
        let newEvent = EKEvent(eventStore: self)
        newEvent.calendar = defaultCalendarForNewEvents
        
        newEvent.title = event.title
        newEvent.startDate = event.startDate
        newEvent.endDate = event.endDate
        newEvent.notes = event.notes
        newEvent.url = event.url
        
        if let eventLocation = event.location {
            let location = EKStructuredLocation()
            location.title = eventLocation.name
            location.geoLocation = CLLocation(
                latitude: eventLocation.coordinates.latitude,
                longitude: eventLocation.coordinates.longitude
            )
            newEvent.structuredLocation = location
        }
        
        return newEvent
    }
}
