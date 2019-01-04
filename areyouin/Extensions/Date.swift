//
//  Date.swift
//  areyouin
//
//  Created by Robert Sandru on 1/4/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import Foundation

extension Date {
    func eventCellFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
    
    init(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX") as Locale
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
}
