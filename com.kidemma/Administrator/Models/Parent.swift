//
//  Parent.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 12/02/26.
//

import Foundation

struct Parent: Decodable {
    var name: String
    
    var children: [Child] = []
    
    init(name: String) {
        self.name = name
    }
}
