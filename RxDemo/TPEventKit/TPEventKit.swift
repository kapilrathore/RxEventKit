//
//  TPEventKit.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 02/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Foundation
import EventKit
import RxSwift

class TPEventKit {
    let eventStore: EventStore
    private let authorizer: TPAuthorizer
    private let eventCreator: TPEventCreator
    
    init(
        eventStore: EventStore = EKEventStore(),
        authorizer: TPAuthorizer = TPEKAuthorizer(),
        eventCreator: TPEventCreator = TPEKEventCreator()
    ) {
        self.eventStore = eventStore
        self.authorizer = authorizer
        self.eventCreator = eventCreator
    }
    
    func createNewEvent(_ event: TPEvent) -> Observable<TPEvent> {
        if event.isInvalid() {
            return Observable.error(TPError.invalidEvent)
        }
        
        return authorizer.checkAuthorizationStatus(self.eventStore)
            .flatMap { [weak self] accessGranted -> Observable<TPEvent> in
                guard let `self` = self else { return Observable.empty() }
                
                if !accessGranted {
                    return Observable<TPEvent>.error(TPError.permissionDenied)
                }
                
                return self.eventCreator.createCalendarEvent(event, self.eventStore)
            }
            .catchError { Observable.error($0) }
    }
}
