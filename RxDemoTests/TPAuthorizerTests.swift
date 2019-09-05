//
//  TPAuthorizerTests.swift
//  RxDemoTests
//
//  Created by kapilrathore-mbp on 04/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import Cuckoo
@testable import RxDemo

class TPAuthorizerTests: XCTestCase {
    
    var observer: TestableObserver<Bool>!
    var disposeBag: DisposeBag!
    var tpAuthorizer: TPAuthorizer!
    var eventStore: MockEventStore!
    
    typealias RequestAccessCompletion = (Bool, Error?) -> Void

    override func setUp() {
        observer = TestScheduler(initialClock: 0)
            .createObserver(Bool.self)
        disposeBag = DisposeBag()
        tpAuthorizer = TPEKAuthorizer()
        eventStore = MockEventStore()
    }
    
    private func createBinding() {
        // Create Binding
        tpAuthorizer.checkAuthorizationStatus(eventStore)
            .subscribe(observer)
            .disposed(by: disposeBag)
    }
    
    override func tearDown() {
        disposeBag = nil
    }
    
    func test_returns_true_event_if_already_authorized() {
        // Mock
        stub(eventStore) { (storeStub) in
            when(storeStub.isPermissionGranted.get).thenReturn(true)
        }
        
        // Act
        createBinding()
        
        // Assert
        let expectedEvents = [
            Recorded.next(0, true),
            Recorded.completed(0)
        ]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    func test_request_permission_and_error() {
        // Setup
        let requestCompletion: (Bool, Error?) -> Void = { _,_ in }
        let initiallyPermissionGranted = false
        let permissionGrantedOnRequest = false
        let errorOnPermissionRequest: Error? = TPError.permissionDenied
        
        // Mocking
        stub(eventStore) { (storeStub) in
            when(storeStub.isPermissionGranted.get).thenReturn(initiallyPermissionGranted)
            when(storeStub.requestAccess(completion: match(requestCompletion)))
                .then({ $0(permissionGrantedOnRequest, errorOnPermissionRequest) })
        }
        
        // Act
        createBinding()
        
        // Assert
        let expectedValue: [Recorded<Event<Bool>>] = [
            Recorded.error(0, TPError.permissionDenied)
        ]
        XCTAssertEqual(observer.events, expectedValue)
    }
    
    func test_request_permission_and_denied() {
        // Setup
        let requestCompletion: (Bool, Error?) -> Void = { _,_ in }
        let initiallyPermissionGranted = false
        let permissionGrantedOnRequest = false
        let errorOnPermissionRequest: Error? = nil
        
        // Mocking
        stub(eventStore) { (storeStub) in
            when(storeStub.isPermissionGranted.get).thenReturn(initiallyPermissionGranted)
            when(storeStub.requestAccess(completion: match(requestCompletion)))
                .then({ $0(permissionGrantedOnRequest, errorOnPermissionRequest) })
        }
        
        // Act
        createBinding()
        
        // Assert
        let expectedValue: [Recorded<Event<Bool>>] = [
            Recorded.next(0, false),
            Recorded.completed(0)
        ]
        XCTAssertEqual(observer.events, expectedValue)
    }
    
    func test_request_permission_and_granted() {
        // Setup
        let requestCompletion: (Bool, Error?) -> Void = { _,_ in }
        let initiallyPermissionGranted = false
        let permissionGrantedOnRequest = true
        let errorOnPermissionRequest: Error? = nil
        
        // Mocking
        stub(eventStore) { (storeStub) in
            when(storeStub.isPermissionGranted.get).thenReturn(initiallyPermissionGranted)
            when(storeStub.requestAccess(completion: match(requestCompletion)))
                .then({ $0(permissionGrantedOnRequest, errorOnPermissionRequest) })
        }
        
        // Act
        createBinding()
        
        // Assert
        let expectedValue: [Recorded<Event<Bool>>] = [
            Recorded.next(0, true),
            Recorded.completed(0)
        ]
        XCTAssertEqual(observer.events, expectedValue)
    }
    
    func match(_ value: @escaping RequestAccessCompletion) -> ParameterMatcher<RequestAccessCompletion> {
        return Cuckoo.equal(to: value, equalWhen: { _,_ in true })
    }
}
