import RxSwift

struct Employee {
    let name: String
    let yearsOfExperience: Int
}

let kapil = Employee(name: "Kapil", yearsOfExperience: 2)
let shubham = Employee(name: "Shubham", yearsOfExperience: 6)
let priya = Employee(name: "Priya", yearsOfExperience: 4)



// Lifecycle of an Observable (Types of events we get upon subscription)
// Next Event
// Error Event
// Completion Event

//  enum Event<T> {
//      case next(element: T)
//      case error(Error)
//      case completion
//  }





//// Creating New Observables
//// Just Operator
//_ = Observable.just(kapil)
//
//// Of Operator
//_ = Observable.of(kapil, shubham)
//
//// Of Operator
//_ = Observable.of([kapil, shubham])
//
//// From Operator
//_ = Observable.from([kapil, shubham])




//// Subscribing to the STREAM OF EVENTS emitted by the observables.
//let employeeStream = Observable.of(kapil, shubham, priya)
//
//employeeStream.subscribe { event in
//    print(event.element ?? event)
//}
//
////  ==> Output
////  next(Employee(name: "Kapil", yearsOfExperience: 2))
////  next(Employee(name: "Shubham", yearsOfExperience: 6))
////  next(Employee(name: "Priya", yearsOfExperience: 4))
////  completed

//employeeStream.subscribe(
//    onNext: { print($0.name) },
//    onError: { print($0) },
//    onCompleted: { print("Completion Event (Stream Terminates Here)") }
//)






//// Empty and Never

//Observable<Void>.empty().subscribe { print($0) }
//// Output ==> completed
//
//Observable<Void>.never().subscribe { print($0) }
//// Output ==> .... (nothing, emits no event)







//// Disposables, Disposing Streams, Cancelling Subscription

//Observable.just(kapil)
//    .subscribe({ print($0) })
//    .dispose()
////    .disposed(by: DisposeBag())
//
////var disposables = CompositeDisposable()
////disposables.insert(
////    Observable.just(kapil).subscribe({ print($0) })
////)






//enum ErrorType: Error {
//    case someError, someOtherError
//}
//
//let someObservable = Observable<Employee>.create { observer -> Disposable in
//    observer.onNext(kapil)
////    observer.onError(ErrorType.someError)
//    observer.onNext(shubham)
//    observer.onNext(priya)
//    return Disposables.create()
//}
//
//someObservable.subscribe(
//    onNext: { print("Next Event : \($0)") },
//    onError: { print("Error Event : \($0), Stream Terminated") },
//    onCompleted: { print("Completion Event, Stream Terminated") },
//    onDisposed: { print("Stream Disposed") }
//).dispose()
//
////  Output ==>
////  Next Event : Employee(name: "Kapil", yearsOfExperience: 2)
////  Error Event : someError, Stream Terminated
////  Stream Disposed








// Traits (SINGLE, COMPLETABLE, MAYBE)








// SIDE EFFECTS ==> "do" operator








// SUBJECTS (Publish, Behaviour, Replay) (Variable -> No error events)
// RELAYS same as SUBJECTS but without error or completion events.

// IMP => ALL SUBJECT TYPES WILL RE-EMIT THE TERMINATION EVENTS (error or completion)






















// FILTERING
// 1. ignoreElements() ==> filters out all the next events and passes only termination events.
// 2. elementAt(_ index: Int) ==> only passes down one specefic event

// 3. Filter ==> same as Swift Filter func [1, 2, 3].filter { $0 > 1 }

// 4. Skip(_ count: Int) ==> to skip some elements
// 5. SkipWhile(_ (T)->Bool) ==> stops skipping once the condition fails

// 6. take(_ count: Int) ==> opposite of skip
// 7. takeWhilw(_ condition: (T)->Bool) ==> opposite of skip while

// 8. skipUntill

// 9. distinctUntillChanged




// SHARE OPERATOR ==> sharing a single subsrciption to an observable
// share(replay: scope: )





// SCHEDULERS
// subscribeOn(_ schedular:) and observeOn(_ schedular:)



// debounce(last element) and throttle(first and last element)








// TRANFORMING OPERATORS

// 1. map (transform on same stream)
// 2. flatMap (creates new observable stream for every element and merges into a single output stream)

// 3. flatMapLatest (same as flatMap but only takes lastest stream and discards the rest)








// COMBINING OPERATORS

// 1. startWith(_ element) ==> always the first element to be emitted
//Observable.of(1,2,3)
//    .startWith(0)
//    .subscribe(onNext: { print($0) }) // 0,1,2,3

//// 2. Concat (A+B) ==> first all elements of stream A are emitted then all of B
//let streamA = Observable.of(1,2,3)
//let streamB = Observable.from([4,5,6])
//Observable.concat(streamA, streamB)
//    .subscribe(onNext: { print($0) })


// 3. Merge (A+B) ==> all elements of A and B in the order or emission regarless of the stream.



//// 4. combineLatest(A+B)
//let streamA = PublishSubject<Int>()
//let streamB = PublishSubject<Int>()
//
//Observable.combineLatest(streamA, streamB) { $0 + $1 }
//    .subscribe(onNext: { print($0) })
//
//streamA.onNext(1)
//streamB.onNext(3) // 4
//streamB.onNext(4) // 5
//streamA.onNext(3) // 7


// 5. zip(A+B) ==> has to have same number of elements

// 6. switchLatest() ==> works same as flatMapLatest

// flatMapLatest = map + switchMapLatest

// 7. A.amb(B)

//// 8. reduce(_ initialValue: _ accumulator: Operator) ==> reduce all elements of a stream to one
//Observable.of(1,2,3)
//    .reduce(0, accumulator: +)
//    .subscribe(onNext: { print($0) }) // 6
//
//// 9. scan ==> same as reduce but emits all the values
//Observable.of(1,2,3)
//    .scan(0, accumulator: +)
//    .subscribe(onNext: { print($0) }) // 1, 3, 6


//let a = Observable.of(1,2,3)
//let b = Observable.of(4,5,6)
//
//Observable.zip(a, b)
//    .map { $0 * $1 }
//    .scan(0, accumulator: +)
//    .subscribe(onNext: { print($0) }) // 4, 14, 32
