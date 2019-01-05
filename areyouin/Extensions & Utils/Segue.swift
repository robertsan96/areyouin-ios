//
//  Segue.swift
//  areyouin
//
//  Created by Robert Sandru on 1/5/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import Foundation

enum Segues {
    
    case toEventDetails
    
    func identifier() -> String {
        switch self {
        case .toEventDetails: return "toEventDetails"
        }
    }
}
