// MARK: - Mocks generated from file: RxDemo/TPEventKit/TPAuthorizer.swift at 2019-09-04 09:33:32 +0000

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
    

    

    

    
    
    
     func checkAuthorizationStatus(_ eventStore: EKEventStore) -> Observable<Bool> {
        
    return cuckoo_manager.call("checkAuthorizationStatus(_: EKEventStore) -> Observable<Bool>",
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
	    
	    
	    func checkAuthorizationStatus<M1: Cuckoo.Matchable>(_ eventStore: M1) -> Cuckoo.ProtocolStubFunction<(EKEventStore), Observable<Bool>> where M1.MatchedType == EKEventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(EKEventStore)>] = [wrap(matchable: eventStore) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTPAuthorizer.self, method: "checkAuthorizationStatus(_: EKEventStore) -> Observable<Bool>", parameterMatchers: matchers))
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
	    func checkAuthorizationStatus<M1: Cuckoo.Matchable>(_ eventStore: M1) -> Cuckoo.__DoNotUse<(EKEventStore), Observable<Bool>> where M1.MatchedType == EKEventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(EKEventStore)>] = [wrap(matchable: eventStore) { $0 }]
	        return cuckoo_manager.verify("checkAuthorizationStatus(_: EKEventStore) -> Observable<Bool>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TPAuthorizerStub: TPAuthorizer {
    

    

    
     func checkAuthorizationStatus(_ eventStore: EKEventStore) -> Observable<Bool>  {
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
    

    

    

    
    
    
     override func checkAuthorizationStatus(_ eventStore: EKEventStore) -> Observable<Bool> {
        
    return cuckoo_manager.call("checkAuthorizationStatus(_: EKEventStore) -> Observable<Bool>",
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
	    
	    
	    func checkAuthorizationStatus<M1: Cuckoo.Matchable>(_ eventStore: M1) -> Cuckoo.ClassStubFunction<(EKEventStore), Observable<Bool>> where M1.MatchedType == EKEventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(EKEventStore)>] = [wrap(matchable: eventStore) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTPEKAuthorizer.self, method: "checkAuthorizationStatus(_: EKEventStore) -> Observable<Bool>", parameterMatchers: matchers))
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
	    func checkAuthorizationStatus<M1: Cuckoo.Matchable>(_ eventStore: M1) -> Cuckoo.__DoNotUse<(EKEventStore), Observable<Bool>> where M1.MatchedType == EKEventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(EKEventStore)>] = [wrap(matchable: eventStore) { $0 }]
	        return cuckoo_manager.verify("checkAuthorizationStatus(_: EKEventStore) -> Observable<Bool>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TPEKAuthorizerStub: TPEKAuthorizer {
    

    

    
     override func checkAuthorizationStatus(_ eventStore: EKEventStore) -> Observable<Bool>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Bool>).self)
    }
    
}


// MARK: - Mocks generated from file: RxDemo/TPEventKit/TPEventCreator.swift at 2019-09-04 09:33:32 +0000

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
    

    

    

    
    
    
     func createCalendarEvent(_ event: TPEvent, _ eventStore: EKEventStore) -> Observable<TPEvent> {
        
    return cuckoo_manager.call("createCalendarEvent(_: TPEvent, _: EKEventStore) -> Observable<TPEvent>",
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
	    
	    
	    func createCalendarEvent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ event: M1, _ eventStore: M2) -> Cuckoo.ProtocolStubFunction<(TPEvent, EKEventStore), Observable<TPEvent>> where M1.MatchedType == TPEvent, M2.MatchedType == EKEventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent, EKEventStore)>] = [wrap(matchable: event) { $0.0 }, wrap(matchable: eventStore) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTPEventCreator.self, method: "createCalendarEvent(_: TPEvent, _: EKEventStore) -> Observable<TPEvent>", parameterMatchers: matchers))
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
	    func createCalendarEvent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ event: M1, _ eventStore: M2) -> Cuckoo.__DoNotUse<(TPEvent, EKEventStore), Observable<TPEvent>> where M1.MatchedType == TPEvent, M2.MatchedType == EKEventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent, EKEventStore)>] = [wrap(matchable: event) { $0.0 }, wrap(matchable: eventStore) { $0.1 }]
	        return cuckoo_manager.verify("createCalendarEvent(_: TPEvent, _: EKEventStore) -> Observable<TPEvent>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TPEventCreatorStub: TPEventCreator {
    

    

    
     func createCalendarEvent(_ event: TPEvent, _ eventStore: EKEventStore) -> Observable<TPEvent>  {
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
    

    

    

    
    
    
     override func createCalendarEvent(_ event: TPEvent, _ eventStore: EKEventStore) -> Observable<TPEvent> {
        
    return cuckoo_manager.call("createCalendarEvent(_: TPEvent, _: EKEventStore) -> Observable<TPEvent>",
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
	    
	    
	    func createCalendarEvent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ event: M1, _ eventStore: M2) -> Cuckoo.ClassStubFunction<(TPEvent, EKEventStore), Observable<TPEvent>> where M1.MatchedType == TPEvent, M2.MatchedType == EKEventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent, EKEventStore)>] = [wrap(matchable: event) { $0.0 }, wrap(matchable: eventStore) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTPEKEventCreator.self, method: "createCalendarEvent(_: TPEvent, _: EKEventStore) -> Observable<TPEvent>", parameterMatchers: matchers))
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
	    func createCalendarEvent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ event: M1, _ eventStore: M2) -> Cuckoo.__DoNotUse<(TPEvent, EKEventStore), Observable<TPEvent>> where M1.MatchedType == TPEvent, M2.MatchedType == EKEventStore {
	        let matchers: [Cuckoo.ParameterMatcher<(TPEvent, EKEventStore)>] = [wrap(matchable: event) { $0.0 }, wrap(matchable: eventStore) { $0.1 }]
	        return cuckoo_manager.verify("createCalendarEvent(_: TPEvent, _: EKEventStore) -> Observable<TPEvent>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TPEKEventCreatorStub: TPEKEventCreator {
    

    

    
     override func createCalendarEvent(_ event: TPEvent, _ eventStore: EKEventStore) -> Observable<TPEvent>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<TPEvent>).self)
    }
    
}

