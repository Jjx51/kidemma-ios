//
//  IconGridButton.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 16/02/26.
//

import SwiftUI

struct IconGridButton: View {
    @Binding var isListView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isListView.toggle()
            } label: {
                Image(systemName: isListView ? "list.bullet" : "square.grid.2x2")
                    .foregroundStyle(Color("DisabledButtonText"))
                    .padding(12)
                    .frame(width: 40, height: 40)
            }
            .background(Color("SecondaryButtonBackground"))
            .clipShape(.circle)
            .shadow(radius: 3, x: 0, y: 3)
        }
    }
}

#Preview {
    IconGridButton(isListView: .constant(false))
}
