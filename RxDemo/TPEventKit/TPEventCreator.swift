//
//  TPEventCreator.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 03/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Foundation
import RxSwift
import EventKit

protocol TPEventCreator {
    func createCalendarEvent(_ event: TPEvent, _ eventStore: EKEventStore) -> Observable<TPEvent>
}

protocol MockEventStore {
    func save(_ event: EKEvent) -> Bool
}

class TPEKEventCreator: TPEventCreator {
    func createCalendarEvent(_ event: TPEvent, _ eventStore: EKEventStore) -> Observable<TPEvent> {
        return Observable<TPEvent>.create { (observer) -> Disposable in
            let disposables = Disposables.create()
            
            let newEvent = self.getEKEvent(from: event, eventStore)
            
            do {
                try eventStore.save(newEvent, span: .thisEvent)
                observer.onNext(event)
            } catch let error {
                observer.onError(TPError.errorOnSave(reason: error.localizedDescription))
            }
            
            observer.onCompleted()
            
            return disposables
        }
    }
    
    private func getEKEvent(from event: TPEvent, _ eventStore: EKEventStore) -> EKEvent {
        let newEvent = EKEvent(eventStore: eventStore)
        newEvent.calendar = eventStore.defaultCalendarForNewEvents
        
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
