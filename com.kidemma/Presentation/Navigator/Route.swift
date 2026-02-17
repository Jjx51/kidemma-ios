//
//  Route.swift
//  com.kidemma
//
//  Created by Leonardo González on 27/10/25.
//

import Foundation
import SwiftUI

enum AppTab: Hashable {
    case home
    case post
}

enum Route: Hashable {
    case home(HomeRoutes)
    case posts(PostRoutes)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home(let route):
            route.destination
            
        case .posts(let route):
            route.destination
        }
    }
    
    var tab: AppTab {
        switch self {
        case .home: return .home
        case .posts: return .post
        }
    }
}
