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
    func createCalendarEvent(_ event: TPEvent, _ eventStore: EventStore) -> Observable<TPEvent>
}

class TPEKEventCreator: TPEventCreator {
    func createCalendarEvent(_ event: TPEvent, _ eventStore: EventStore) -> Observable<TPEvent> {
        return Observable<TPEvent>.create { (observer) -> Disposable in
            let disposables = Disposables.create()
            
            do {
                try eventStore.save(event)
                observer.onNext(event)
            } catch let error {
                print("\n\nError on save \(error.localizedDescription)")
                observer.onError(TPError.errorOnSave(reason: error.localizedDescription))
            }
            
            observer.onCompleted()
            
            return disposables
        }
    }
}
