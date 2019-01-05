//
//  EventDetailsVM.swift
//  areyouin
//
//  Created by Robert Sandru on 1/5/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import Foundation
import RxSwift

class EventDetailsVM {
    
    var event: BehaviorSubject<Event>
    
    init(with event: Event) {
        self.event = BehaviorSubject(value: event)
    }
}
