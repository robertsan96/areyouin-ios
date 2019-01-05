//
//  Person.swift
//  areyouin
//
//  Created by Robert Sandru on 1/4/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import Foundation

class Person {
    
    var firstName: String?
    var lastName: String?
    
    var attendanceStatus: AttendanceStatus = .noReply
    
    init(firstName: String, lastName: String, attentanceStatus: AttendanceStatus) {
        self.firstName = firstName
        self.lastName = lastName
        self.attendanceStatus = attentanceStatus
    }
    
    static func DUMMY(number: Int) -> [Person] {
        let p1 = Person(firstName: "John", lastName: "Doe", attentanceStatus: .isIn)
        let p2 = Person(firstName: "Kali", lastName: "Liunx", attentanceStatus: .isIn)
        let p3 = Person(firstName: "Jasmine", lastName: "Darina", attentanceStatus: .isOut)
        let p4 = Person(firstName: "Papa", lastName: "John", attentanceStatus: .isOut)
        let p5 = Person(firstName: "Robert", lastName: "San", attentanceStatus: .isIn)
        let p6 = Person(firstName: "Joanna", lastName: "Irland", attentanceStatus: .noReply)
        let p7 = Person(firstName: "Trebor", lastName: "Patson", attentanceStatus: .isIn)
        let p8 = Person(firstName: "Larisa", lastName: "Jiana", attentanceStatus: .isIn)
        let p9 = Person(firstName: "Paralia", lastName: "Ernest", attentanceStatus: .isIn)
        let p10 = Person(firstName: "Georgiana", lastName: "Smith", attentanceStatus: .isOut)
        let p11 = Person(firstName: "Ariana", lastName: "Johnson", attentanceStatus: .noReply)
        let p12 = Person(firstName: "Narcia", lastName: "Elisabeth", attentanceStatus: .isOut)
        let p13 = Person(firstName: "Erasmus", lastName: "Americana", attentanceStatus: .isOut)
        let p14 = Person(firstName: "Andre", lastName: "Jarna", attentanceStatus: .noReply)
        let p15 = Person(firstName: "Harest", lastName: "Robertson", attentanceStatus: .noReply)
        
        var persons: [Person] = []
        persons.append(p1)
        persons.append(p2)
        persons.append(p3)
        persons.append(p4)
        persons.append(p5)
        persons.append(p6)
        persons.append(p7)
        persons.append(p8)
        persons.append(p9)
        persons.append(p10)
        persons.append(p11)
        persons.append(p12)
        persons.append(p13)
        persons.append(p14)
        persons.append(p15)
        
        return Array(persons.prefix(number))
    }
}
