//
//  Kidemma.swift
//  com.kidemma
//
//  Created by Leonardo González on 29/10/25.
//

import SwiftUI

struct Kidemma: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        
        @Bindable var route = self.router
        
        TabView {
            NavigationStack(path: $route[.home]) {
                HomeScreen()
                    .navigationDestination(for: Route.self) { route in
                        route.destination
                    }
            }.tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            NavigationStack(path: $route[.post]) {
                PostsScreen()
                    .navigationDestination(for: Route.self) { route in
                        route.destination
                    }
            }.tabItem {
                Label("Posts", systemImage: "photo")
            }
        }
    }
}

#Preview {
    Kidemma()
        .environment(Router())
}
