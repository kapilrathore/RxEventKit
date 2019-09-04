//
//  TPEventKitTests.swift
//  TPEventKitTests
//
//  Created by kapilrathore-mbp on 24/08/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa
import EventKit
import Cuckoo

@testable import RxDemo

class RxDemoTests: XCTestCase {
    var observer: TestableObserver<TPEvent>!
    var disposeBag: DisposeBag!
    
    var tpEvent: TPEvent!
    
    var tpEventStore: EKEventStore!
    var mockAuthorizer: MockTPAuthorizer!
    var mockEventCreator: MockTPEventCreator!
    var tpEventKit: TPEventKit!
    
    override func setUp() {
        observer = TestScheduler.init(initialClock: 0)
            .createObserver(TPEvent.self)
        disposeBag = DisposeBag()
        
        tpEventStore = EKEventStore()
        mockAuthorizer =  MockTPAuthorizer()
        mockEventCreator = MockTPEventCreator()
        
        tpEvent = TPEvent(title: "Some Event")
        tpEvent.startDate = Date().addingTimeInterval(100)
        tpEvent.endDate = Date().addingTimeInterval(150)
        
        tpEventKit = TPEventKit(
            eventStore: tpEventStore,
            authorizer: mockAuthorizer,
            eventCreator: mockEventCreator
        )
    }
    
    func createBinding(with event: TPEvent) {
        tpEventKit.createNewEvent(event)
            .subscribe(observer)
            .disposed(by: disposeBag)
    }
    
    override func tearDown() {
        disposeBag = nil
        tpEvent = nil
    }
    
    // Invalid TPEvent -> TPError.invalidEvent
    func test_Emit_TPError_when_TPEvent_is_invalid() {
        // Setup
        let tpError = TPError.invalidEvent
        tpEvent = TPEvent(title: "")
        
        // Act
        createBinding(with: tpEvent)
        
        // Assert
        let expectedEvents: [Recorded<Event<TPEvent>>] = [
            .error(0, tpError)
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    // Valid Event -> Permission Denied -> TPError.permissionDenied
    func test_RequestPermission_Denied() {
        // Setup
        let tpError = TPError.permissionDenied
        
        // Mock
        stub(mockAuthorizer) { (authMock) in
            when(authMock.checkAuthorizationStatus(match(tpEventStore)))
                .thenReturn(Observable.just(false))
        }
        
        // Act
        createBinding(with: tpEvent)
        
        // Assert
        let expectedEvents: [Recorded<Event<TPEvent>>] = [
            .error(0, tpError)
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    // Valid Event -> Permission Granted -> Error on Save
    func test_RequestPermission_Granted_SaveEvent_Error() {
        // Setup
        let errorReason = "Some random error"
        let tpError = TPError.errorOnSave(reason: errorReason)
        let createCalendarEvent = Observable<TPEvent>.error(tpError)
        
        // Mock
        stub(mockAuthorizer) { (authMock) in
            when(authMock.checkAuthorizationStatus(match(tpEventStore)))
                .thenReturn(Observable.just(true))
        }
        
        stub(mockEventCreator) { (creatorStub) in
            when(creatorStub.createCalendarEvent(match(tpEvent), match(tpEventStore)))
                .thenReturn(createCalendarEvent)
        }

        // Act
        createBinding(with: tpEvent)

        // Assert
        let expectedEvents: [Recorded<Event<TPEvent>>] = [
            .error(0, tpError)
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    // Valid Event -> Permission Granted -> Event Successfully Saved
    func test_RequestPermission_Granted_SaveEvent_Success() {
        // Mock
        stub(mockAuthorizer) { (authStub) in
            when(authStub.checkAuthorizationStatus(match(tpEventStore)))
                .thenReturn(Observable.just(true))
        }
        
        stub(mockEventCreator) { (creatorStub) in
            when(creatorStub.createCalendarEvent(match(tpEvent), match(tpEventStore)))
                .thenReturn(Observable.just(tpEvent))
        }
        
        // Act
        createBinding(with: tpEvent)
        
        // Assert
        let expectedEvents: [Recorded<Event<TPEvent>>] = [
            .next(0, tpEvent),
            .completed(0)
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    
    func match(_ value: TPEvent) -> ParameterMatcher<TPEvent> {
        return Cuckoo.equal(to: value, equalWhen: { $0.self == $1.self })
    }
    
    func match(_ value: EKEventStore) -> ParameterMatcher<EKEventStore> {
        return Cuckoo.equal(to: value, equalWhen: { $0 === $1 })
    }
}
