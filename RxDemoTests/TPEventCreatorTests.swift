//
//  TPEventCreatorTests.swift
//  RxDemoTests
//
//  Created by kapilrathore-mbp on 04/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import EventKit
@testable import RxDemo

class TPEventCreatorTests: XCTestCase {
    var observer: TestableObserver<TPEvent>!
    var disposeBag: DisposeBag!
    
    var eventCreator: TPEKEventCreator!
    var tpEvent: TPEvent!
    
    var eventStore: EKEventStore! = MockEventStore()

    override func setUp() {
        observer = TestScheduler(initialClock: 0)
            .createObserver(TPEvent.self)
        disposeBag = DisposeBag()
        
        eventCreator = TPEKEventCreator()
        
        tpEvent = TPEvent(title: "Test Event")
        tpEvent.startDate = Date().addingTimeInterval(10)
        tpEvent.endDate = Date().addingTimeInterval(20)
    }
    
    private func createBinding(_ event: TPEvent, _ store: EKEventStore) {
        eventCreator.createCalendarEvent(event, store)
            .subscribe(observer)
            .disposed(by: disposeBag)
    }

    override func tearDown() {
        tpEvent = nil
    }
    
    func test_create_calendar_event_error() {
        
        createBinding(tpEvent, <#T##store: EKEventStore##EKEventStore#>)
        
        // Assert
        let expectedEvents: [Recorded<Event<TPEvent>>] = [
            Recorded.error(0, TPError.errorOnSave(reason: "Error Reason"))
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    func test_create_calendar_event_success() {
        eventCreator.createCalendarEvent(tpEvent, eventStore)
            .subscribe(observer)
            .disposed(by: disposeBag)
        
        // Assert
        let expectedEvents: [Recorded<Event<TPEvent>>] = [
            Recorded.next(0, tpEvent),
            Recorded.completed(0)
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }

    func test_getEKEvent_from_TPEvent() {
        generateTPEvent()
    }
    
    private func generateTPEvent() {
        tpEvent = TPEvent(title: "Test Event Title")
        tpEvent.startDate = Date().addingTimeInterval(10)
        tpEvent.endDate = Date().addingTimeInterval(10)
        tpEvent.notes = "Test notes"
        tpEvent.url = URL(string: "https://www.google.com/")
        tpEvent.location = TPEvent.Location(name: "Test Location", coordinates: (latitude: 5.5, longitude: 7.5))
    }
}

class MockEventStore: EKEventStore {
    override func save(_ event: EKEvent, span: EKSpan) throws {
        
    }
}
