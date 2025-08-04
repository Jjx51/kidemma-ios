//
//  Item.swift
//  com.kidemma
//
//  Created by Alan Delgado on 03/08/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
