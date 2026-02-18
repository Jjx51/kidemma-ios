//
//  ChildrenToolbar.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 11/02/26.
//

import SwiftUI

struct ChildrenToolbar: View {
    @Binding var childrenSearch: String
    @Binding var isListView: Bool
    
    @FocusState var kidSearchTyping
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                TextField("Escribe algo", text: $childrenSearch)
                    .font(.custom("Poppins-Regular", size: 16))
                    .textFieldStyle(.plain)
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                    .background(Color("ToolbarBackground"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .focused($kidSearchTyping)
                    .shadow(radius: 3, x: 0, y: 3)
                Button {
                    
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(Color("DisabledButtonText"))
                        .padding(12)
                }
                .background(Color("SecondaryButtonBackground"))
                .clipShape(.rect(cornerRadius: 8))
                .shadow(radius: 3, x: 0, y: 3)
            }
            .padding(.top, 14)
        }
    }
}

#Preview {
    ChildrenToolbar(childrenSearch: .constant(""), isListView: .constant(false))
}
