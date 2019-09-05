//
//  TPAuthorizer.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 03/09/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import Foundation
import RxSwift
import EventKit

protocol TPAuthorizer {
    func checkAuthorizationStatus(_ eventStore: EventStore) -> Observable<Bool>
}

class TPEKAuthorizer: TPAuthorizer {
    func checkAuthorizationStatus(_ eventStore: EventStore) -> Observable<Bool> {
        return Observable.create({ observer -> Disposable in
            let disposables = Disposables.create()
            
            if eventStore.isPermissionGranted {
                observer.onNext(true)
                observer.onCompleted()
                return disposables
            }
            
            eventStore.requestAccess() { (granted, error) in
                guard error == nil else {
                    observer.onError(TPError.permissionDenied)
                    return
                }
                observer.onNext(granted)
                observer.onCompleted()
            }
            
            return disposables
        })
    }
}
