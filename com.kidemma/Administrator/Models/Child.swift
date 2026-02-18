//
//  Child.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 12/02/26.
//

import Foundation

struct Child: Identifiable, Decodable {
    var id: Int
    var name: String
    var ageAsString: String
    var gender: Gender
    var reservedDays: [WeekDay] = []

    var parents: [Parent]?
        
    init(name: String, ageAsString: String, gender: Gender = .other, reservedDays: [WeekDay] = []) {
        self.id = Int.random(in: 1...1000)
        self.name = name
        self.ageAsString = ageAsString
        self.gender = gender
        self.reservedDays = reservedDays
    }
}

enum WeekDay: String, CaseIterable, Decodable {
    case mon = "L"
    case tue = "M"
    case wed = "X"
    case thu = "J"
    case fri = "V"
    case sat = "S"
    case sun = "D"
}
