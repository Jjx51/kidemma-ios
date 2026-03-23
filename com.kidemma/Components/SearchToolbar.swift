//
//  ChildrenToolbar.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 11/02/26.
//

import SwiftUI

struct SearchToolbar: View {
    @Binding var termSearch: String
    
    @FocusState var kidSearchTyping
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                TextField("Escribe algo", text: $termSearch)
                    .font(.custom("Poppins-Regular", size: 16))
                    .bold()
                    .textFieldStyle(.plain)
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                    .background(Color("ToolbarBackground"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .focused($kidSearchTyping)
                    .shadow(radius: 3, x: 0, y: 3)
                    .overlay(
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color("DisabledButtonText"))
                                .padding(.trailing, 12)
                        }
                    )
                Button {
                    
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(Color("DisabledButtonText"))
                        .padding(12)
                }
                .frame(minHeight: 50)
                .background(Color("SecondaryButtonBackground"))
                .clipShape(.rect(cornerRadius: 8))
                .shadow(radius: 3, x: 0, y: 3)
            }
        }
    }
}

#Preview {
    SearchToolbar(termSearch: .constant(""))
}
