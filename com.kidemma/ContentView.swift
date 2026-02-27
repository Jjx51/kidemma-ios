//
//  ContentView.swift
//  com.kidemma
//
//  Created by Alan Delgado on 03/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @AppStorage("app.language") private var languageCode: String = "system"
    private var appLanguage: AppLanguage { AppLanguage(rawValue: languageCode) ?? .system }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text(L10n.key("content.itemAt", bundle: appLanguage.bundle, defaultValue: "Item at"))
                        + Text(" ")
                        + Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label {
                            Text(L10n.key("content.addItem", bundle: appLanguage.bundle, defaultValue: "Add Item"))
                        } icon: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        } detail: {
            Text(L10n.key("content.selectItem", bundle: appLanguage.bundle, defaultValue: "Select an item"))
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
