//
//  PostRoutes.swift
//  com.kidemma
//
//  Created by Leonardo González on 29/10/25.
//

import Foundation
import SwiftUI

struct Post: Hashable {
    let id: Int
    let title: String
    let body: String
}

enum PostRoutes: Hashable {
    case detail(Post)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .detail(let post):
            Text("Post Detail \(post.title)")
        }
    }
    
}
