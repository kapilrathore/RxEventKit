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
import Cuckoo
import EventKit
@testable import RxDemo

class TPEventCreatorTests: XCTestCase {
    var observer: TestableObserver<TPEvent>!
    var disposeBag: DisposeBag!
    
    var eventCreator: TPEKEventCreator!
    var tpEvent: TPEvent!
    
    var eventStore: MockEventStore!

    override func setUp() {
        observer = TestScheduler(initialClock: 0)
            .createObserver(TPEvent.self)
        disposeBag = DisposeBag()
        
        eventCreator = TPEKEventCreator()
        eventStore = MockEventStore()
        
        tpEvent = TPEvent(title: "Test Event")
        tpEvent.startDate = Date().addingTimeInterval(10)
        tpEvent.endDate = Date().addingTimeInterval(20)
    }
    
    private func createBinding(_ event: TPEvent, _ store: EventStore) {
        eventCreator.createCalendarEvent(event, store)
            .subscribe(observer)
            .disposed(by: disposeBag)
    }

    override func tearDown() {
        tpEvent = nil
    }
    
    func test_create_calendar_event_error() {
        // Setup
        let errorOnSave = TPError.invalidEvent
        
        // Mock
        stub(eventStore) { (storeStub) in
            when(storeStub.save(match(tpEvent)))
                .thenThrow(errorOnSave)
        }
        
        // Act
        createBinding(tpEvent, eventStore)
        
        // Assert
        let expectedEvents: [Recorded<Event<TPEvent>>] = [
            Recorded.error(0, TPError.errorOnSave(reason: errorOnSave.localizedDescription))
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    func test_create_calendar_event_success() {
        // Mock
        stub(eventStore) { (storeStub) in
            when(storeStub.save(match(tpEvent)))
                .thenDoNothing()
        }
        
        // Act
        createBinding(tpEvent, eventStore)
        
        // Assert
        let expectedEvents: [Recorded<Event<TPEvent>>] = [
            Recorded.next(0, tpEvent),
            Recorded.completed(0)
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    func match(_ value: TPEvent) -> ParameterMatcher<TPEvent> {
        return Cuckoo.equal(to: value, equalWhen: { $0.self == $1.self })
    }
}
