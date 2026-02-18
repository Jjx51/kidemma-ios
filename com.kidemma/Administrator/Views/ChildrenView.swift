//
//  ChildrenView.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 09/02/26.
//

import SwiftUI

struct ChildrenView: View {
    @State var childrenSearch = ""
    @State var isListView: Bool = false
    
    let children: [Child] = try! JSONDecoder().decode([Child].self, from: Data(contentsOf: Bundle.main.url(forResource: "childrenExample", withExtension: "json")!))

    var body: some View {
        ZStack {
            Color("BackgroundColor")
            VStack {
                HStack{
                    VStack {
                        ChildrenToolbar(childrenSearch: $childrenSearch, isListView: $isListView)
                        IconGridButton(isListView: $isListView)
                    }
                }
                .padding(.horizontal, 25)

                ScrollView {
                    if (!isListView) {
                        LazyVGrid(
                            columns: [
                                GridItem(),
                                GridItem(),
                                GridItem()
                            ],
                            spacing: 20
                        ) {
                            ForEach(children) { child in
                                ChildAvatar(displayName: child.name, gender: child.gender.rawValue)
                            }
                        }
                        .padding(30)
                    }
                    else {
                        ForEach(children) { child in
                            ChildCard(child: child)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ChildrenView()
}
