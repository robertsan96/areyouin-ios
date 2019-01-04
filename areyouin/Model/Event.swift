//
//  Event.swift
//  areyouin
//
//  Created by Robert Sandru on 1/4/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import UIKit

class Event {
    
    var name: String?
    var backgroundImage: UIImage?
    var date: Date?
    var persons: [Person] = []
    
    var nameColor: UIColor?
    var dateColor: UIColor?
    var personsInColor: UIColor?
    
    var personsIn: Int {
        return 15
    }
    
    var personsNoReply: Int {
        return 56
    }
    
    var personsOut: Int {
        return 4
    }
    
    init(name: String?,
         backgroundImage: UIImage?,
         date: Date?,
         nameColor: UIColor? = UIColor.black,
         dateColor: UIColor? = UIColor.black,
         personsInColor: UIColor? = UIColor.black,
         persons: [Person] = []) {
        self.name = name
        self.backgroundImage = backgroundImage
        self.date = date
        self.persons = persons
        
        self.nameColor = nameColor
        self.dateColor = dateColor
        self.personsInColor = personsInColor
    }
}
