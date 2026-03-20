//
//  ContentView.swift
//  com.kidemma
//
//  Created by Alan Delgado on 03/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabBarView()
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
