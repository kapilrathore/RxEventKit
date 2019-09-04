//
//  ViewController.swift
//  RxDemo
//
//  Created by kapilrathore-mbp on 24/08/19.
//  Copyright © 2019 Kapil Rathore. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let tpEventKit = TPEventKit()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let event = TPEvent(title: "Some Random Event")
        
        tpEventKit
            .createNewEvent(event)
            .subscribe { event in
                switch event {
                    case let .next(tpEvent): print("Event : \(tpEvent)")
                    case let .error(error): print("Error : \(error as! TPError)")
                    case .completed: print("Completed")
                }
            }
            .disposed(by: disposeBag)
    }
}

