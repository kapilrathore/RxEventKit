// MARK: - Mocks generated from file: RxDemo/TPEventKit/EventStore.swift at 2019-09-05 07:02:01 +0000

//
//  EventStore.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 04/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Cuckoo
@testable import RxDemo

import EventKit
import Foundation


 class MockEventStore: EventStore, Cuckoo.ProtocolMock {
    
     typealias MocksType = EventStore
    
     typealias Stubbing = __StubbingProxy_EventStore
     typealias Verification = __VerificationProxy_EventStore

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: EventStore?

     func enableDefaultImplementation(_ stub: EventStore) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var defaultCalendar: EKCalendar? {
        get {
            return cuckoo_manager.getter("defaultCalendar",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.defaultCalendar)
        }
        
    }
    
    
    
     var isPermissionGranted: Bool {
        get {
            return cuckoo_manager.getter("isPermissionGranted",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.isPermissionGranted)
        }
        
    }
    

    

    
    
    
     func save(_ event: TPEvent) throws {
        
    return try cuckoo_manager.callThrows("save(_: TPEvent) throws",
            parameters: (event),
            escapingParameters: (event),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.save(event))
        
    }
    
    
    
     func requestAccess(completion: @escaping (Bool, Error?) -> Void)  {
        
    return cuckoo_manager.call("requestAccess(completion: @escaping (Bool, Error?) -> Void)",
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.requestAccess(completion: completion))
        
    }
    

	 struct __StubbingProxy_EventStore: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var defaultCalendar: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockEventStore, EKCalendar?> {
	        return .init(manager: cuckoo_manager, name: "defaultCalendar")
	    }
	    
	    
	    var isPermissionGranted: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockEventStore, Bool> {
	        return .init(manager: cuckoo_manager, name: "isPermissionGranted")
	    }
	    
	    
	    func save<M1: Cuckoo.Matchable>(_ event: M1) -> Cuckoo.ProtocolStubNoReturnThrowingFunction<(TPEvent)> where M1.MatchedType == TPEvent {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent)>] = [wrap(matchable: event) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockEventStore.self, method: "save(_: TPEvent) throws", parameterMatchers: matchers))
	    }
	    
	    func requestAccess<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<((Bool, Error?) -> Void)> where M1.MatchedType == (Bool, Error?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((Bool, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockEventStore.self, method: "requestAccess(completion: @escaping (Bool, Error?) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_EventStore: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var defaultCalendar: Cuckoo.VerifyReadOnlyProperty<EKCalendar?> {
	        return .init(manager: cuckoo_manager, name: "defaultCalendar", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var isPermissionGranted: Cuckoo.VerifyReadOnlyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "isPermissionGranted", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func save<M1: Cuckoo.Matchable>(_ event: M1) -> Cuckoo.__DoNotUse<(TPEvent), Void> where M1.MatchedType == TPEvent {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent)>] = [wrap(matchable: event) { $0 }]
	        return cuckoo_manager.verify("save(_: TPEvent) throws", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func requestAccess<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<((Bool, Error?) -> Void), Void> where M1.MatchedType == (Bool, Error?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((Bool, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
	        return cuckoo_manager.verify("requestAccess(completion: @escaping (Bool, Error?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class EventStoreStub: EventStore {
    
    
     var defaultCalendar: EKCalendar? {
        get {
            return DefaultValueRegistry.defaultValue(for: (EKCalendar?).self)
        }
        
    }
    
    
     var isPermissionGranted: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
    }
    

    

    
     func save(_ event: TPEvent) throws  {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func requestAccess(completion: @escaping (Bool, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: RxDemo/TPEventKit/TPAuthorizer.swift at 2019-09-05 07:02:01 +0000

//
//  TPAuthorizer.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 03/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Cuckoo
@testable import RxDemo

import EventKit
import Foundation
import RxSwift


 class MockTPAuthorizer: TPAuthorizer, Cuckoo.ProtocolMock {
    
     typealias MocksType = TPAuthorizer
    
     typealias Stubbing = __StubbingProxy_TPAuthorizer
     typealias Verification = __VerificationProxy_TPAuthorizer

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TPAuthorizer?

     func enableDefaultImplementation(_ stub: TPAuthorizer) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func checkAuthorizationStatus(_ eventStore: EventStore) -> Observable<Bool> {
        
    return cuckoo_manager.call("checkAuthorizationStatus(_: EventStore) -> Observable<Bool>",
            parameters: (eventStore),
            escapingParameters: (eventStore),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.checkAuthorizationStatus(eventStore))
        
    }
    

	 struct __StubbingProxy_TPAuthorizer: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func checkAuthorizationStatus<M1: Cuckoo.Matchable>(_ eventStore: M1) -> Cuckoo.ProtocolStubFunction<(EventStore), Observable<Bool>> where M1.MatchedType == EventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(EventStore)>] = [wrap(matchable: eventStore) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTPAuthorizer.self, method: "checkAuthorizationStatus(_: EventStore) -> Observable<Bool>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TPAuthorizer: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func checkAuthorizationStatus<M1: Cuckoo.Matchable>(_ eventStore: M1) -> Cuckoo.__DoNotUse<(EventStore), Observable<Bool>> where M1.MatchedType == EventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(EventStore)>] = [wrap(matchable: eventStore) { $0 }]
	        return cuckoo_manager.verify("checkAuthorizationStatus(_: EventStore) -> Observable<Bool>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TPAuthorizerStub: TPAuthorizer {
    

    

    
     func checkAuthorizationStatus(_ eventStore: EventStore) -> Observable<Bool>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Bool>).self)
    }
    
}



 class MockTPEKAuthorizer: TPEKAuthorizer, Cuckoo.ClassMock {
    
     typealias MocksType = TPEKAuthorizer
    
     typealias Stubbing = __StubbingProxy_TPEKAuthorizer
     typealias Verification = __VerificationProxy_TPEKAuthorizer

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: TPEKAuthorizer?

     func enableDefaultImplementation(_ stub: TPEKAuthorizer) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func checkAuthorizationStatus(_ eventStore: EventStore) -> Observable<Bool> {
        
    return cuckoo_manager.call("checkAuthorizationStatus(_: EventStore) -> Observable<Bool>",
            parameters: (eventStore),
            escapingParameters: (eventStore),
            superclassCall:
                
                super.checkAuthorizationStatus(eventStore)
                ,
            defaultCall: __defaultImplStub!.checkAuthorizationStatus(eventStore))
        
    }
    

	 struct __StubbingProxy_TPEKAuthorizer: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func checkAuthorizationStatus<M1: Cuckoo.Matchable>(_ eventStore: M1) -> Cuckoo.ClassStubFunction<(EventStore), Observable<Bool>> where M1.MatchedType == EventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(EventStore)>] = [wrap(matchable: eventStore) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTPEKAuthorizer.self, method: "checkAuthorizationStatus(_: EventStore) -> Observable<Bool>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TPEKAuthorizer: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func checkAuthorizationStatus<M1: Cuckoo.Matchable>(_ eventStore: M1) -> Cuckoo.__DoNotUse<(EventStore), Observable<Bool>> where M1.MatchedType == EventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(EventStore)>] = [wrap(matchable: eventStore) { $0 }]
	        return cuckoo_manager.verify("checkAuthorizationStatus(_: EventStore) -> Observable<Bool>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TPEKAuthorizerStub: TPEKAuthorizer {
    

    

    
     override func checkAuthorizationStatus(_ eventStore: EventStore) -> Observable<Bool>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Bool>).self)
    }
    
}


// MARK: - Mocks generated from file: RxDemo/TPEventKit/TPEventCreator.swift at 2019-09-05 07:02:01 +0000

//
//  TPEventCreator.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 03/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Cuckoo
@testable import RxDemo

import EventKit
import Foundation
import RxSwift


 class MockTPEventCreator: TPEventCreator, Cuckoo.ProtocolMock {
    
     typealias MocksType = TPEventCreator
    
     typealias Stubbing = __StubbingProxy_TPEventCreator
     typealias Verification = __VerificationProxy_TPEventCreator

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TPEventCreator?

     func enableDefaultImplementation(_ stub: TPEventCreator) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func createCalendarEvent(_ event: TPEvent, _ eventStore: EventStore) -> Observable<TPEvent> {
        
    return cuckoo_manager.call("createCalendarEvent(_: TPEvent, _: EventStore) -> Observable<TPEvent>",
            parameters: (event, eventStore),
            escapingParameters: (event, eventStore),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.createCalendarEvent(event, eventStore))
        
    }
    

	 struct __StubbingProxy_TPEventCreator: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func createCalendarEvent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ event: M1, _ eventStore: M2) -> Cuckoo.ProtocolStubFunction<(TPEvent, EventStore), Observable<TPEvent>> where M1.MatchedType == TPEvent, M2.MatchedType == EventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent, EventStore)>] = [wrap(matchable: event) { $0.0 }, wrap(matchable: eventStore) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTPEventCreator.self, method: "createCalendarEvent(_: TPEvent, _: EventStore) -> Observable<TPEvent>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TPEventCreator: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func createCalendarEvent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ event: M1, _ eventStore: M2) -> Cuckoo.__DoNotUse<(TPEvent, EventStore), Observable<TPEvent>> where M1.MatchedType == TPEvent, M2.MatchedType == EventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent, EventStore)>] = [wrap(matchable: event) { $0.0 }, wrap(matchable: eventStore) { $0.1 }]
	        return cuckoo_manager.verify("createCalendarEvent(_: TPEvent, _: EventStore) -> Observable<TPEvent>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TPEventCreatorStub: TPEventCreator {
    

    

    
     func createCalendarEvent(_ event: TPEvent, _ eventStore: EventStore) -> Observable<TPEvent>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<TPEvent>).self)
    }
    
}



 class MockTPEKEventCreator: TPEKEventCreator, Cuckoo.ClassMock {
    
     typealias MocksType = TPEKEventCreator
    
     typealias Stubbing = __StubbingProxy_TPEKEventCreator
     typealias Verification = __VerificationProxy_TPEKEventCreator

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: TPEKEventCreator?

     func enableDefaultImplementation(_ stub: TPEKEventCreator) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func createCalendarEvent(_ event: TPEvent, _ eventStore: EventStore) -> Observable<TPEvent> {
        
    return cuckoo_manager.call("createCalendarEvent(_: TPEvent, _: EventStore) -> Observable<TPEvent>",
            parameters: (event, eventStore),
            escapingParameters: (event, eventStore),
            superclassCall:
                
                super.createCalendarEvent(event, eventStore)
                ,
            defaultCall: __defaultImplStub!.createCalendarEvent(event, eventStore))
        
    }
    

	 struct __StubbingProxy_TPEKEventCreator: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func createCalendarEvent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ event: M1, _ eventStore: M2) -> Cuckoo.ClassStubFunction<(TPEvent, EventStore), Observable<TPEvent>> where M1.MatchedType == TPEvent, M2.MatchedType == EventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent, EventStore)>] = [wrap(matchable: event) { $0.0 }, wrap(matchable: eventStore) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTPEKEventCreator.self, method: "createCalendarEvent(_: TPEvent, _: EventStore) -> Observable<TPEvent>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TPEKEventCreator: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func createCalendarEvent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ event: M1, _ eventStore: M2) -> Cuckoo.__DoNotUse<(TPEvent, EventStore), Observable<TPEvent>> where M1.MatchedType == TPEvent, M2.MatchedType == EventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent, EventStore)>] = [wrap(matchable: event) { $0.0 }, wrap(matchable: eventStore) { $0.1 }]
	        return cuckoo_manager.verify("createCalendarEvent(_: TPEvent, _: EventStore) -> Observable<TPEvent>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TPEKEventCreatorStub: TPEKEventCreator {
    

    

    
     override func createCalendarEvent(_ event: TPEvent, _ eventStore: EventStore) -> Observable<TPEvent>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<TPEvent>).self)
    }
    
}

