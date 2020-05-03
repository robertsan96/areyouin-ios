//
//  Group.swift
//  areyouin
//
//  Created by Robert Sandru on 1/5/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import Foundation

class Group {

    var name: String?
    var persons: [Person] = []
    var type: GroupType = .single
    
    init(with name: String, persons: [Person]) {
        self.name = name
        self.persons = persons
        self.type = .group
    }
    
    init(with name: String, person: Person) {
        self.name = name
        self.persons.append(person)
        self.type = .single
    }
    
    static func DUMMY(number: Int) -> [Group] {
        let g1 = Group(with: "Single", person: Person.DUMMY(number: 1).first!)
        let g2 = Group(with: "Johnson Fam", persons: Person.DUMMY(number: 4))
        let g3 = Group(with: "Single", person: Person.DUMMY(number: 1).last!)
        let g4 = Group(with: "Andre Fam", persons: Person.DUMMY(number: 3))
        let g5 = Group(with: "Single", person: Person.DUMMY(number: 3)[2])
        let g6 = Group(with: "Work Colleagues", persons: Person.DUMMY(number: 14))
        let g7 = Group(with: "Single", person: Person.DUMMY(number: 5)[4])
        let g8 = Group(with: "Single", person: Person.DUMMY(number: 6)[5])
        let g9 = Group(with: "Single", person: Person.DUMMY(number: 7)[6])
        let g10 = Group(with: "Single", person: Person.DUMMY(number: 8)[7])
        
        var groups: [Group] = []
        groups.append(g1)
        groups.append(g2)
        groups.append(g3)
        groups.append(g4)
        groups.append(g5)
        groups.append(g6)
        groups.append(g7)
        groups.append(g8)
        groups.append(g9)
        groups.append(g10)
        
        return Array(groups.prefix(number))
    }
}
