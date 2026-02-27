//
//  SectionModel.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 11/02/26.
//

import Foundation

struct SectionModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    var items: [SectionItem]
}

struct SectionItem: Identifiable {
    let id = UUID()
    let icon: String?
    let title: String
    let count: Int
    
    init(icon: String? = nil, title: String, count: Int) {
        self.icon = icon
        self.title = title
        self.count = count
    }
    
}
