//
//  HomeScreen.swift
//  com.kidemma
//
//  Created by Leonardo González on 29/10/25.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        Text("Home screen")
        
        Button("Go to Class Status") {
            self.router.push(.home(.classStatus))
        }
    }
}

#Preview {
    HomeScreen()
        .environment(Router())
}
