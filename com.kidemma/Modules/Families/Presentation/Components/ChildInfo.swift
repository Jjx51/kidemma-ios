//
//  ChildInfo.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 18/02/26.
//

import SwiftUI

struct ChildInfo: View {
    @Binding var child: Child
    var body: some View {
        HStack(spacing: 16) {
            Image(child.gender.rawValue == "female" ? .girl : .boy)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.black)
                .padding(4)
                .frame(width: 30)
                .clipShape(.circle)
                .overlay(Circle().stroke(
                    Color("IconColor"),
                    lineWidth: 2
                ))
            VStack(alignment: .leading) {
                Text(child.name)
                    .font(.headline)
                    .lineLimit(1)
                HStack {
                    Text("Edad:")
                        .font(.headline)
                    Text(child.ageAsString)
                }
            }
        }
        .padding(.horizontal, 14)
    }
}

#Preview {
    ChildInfo(child: .constant(
        Child(
            name: "Daniel Robles López",
            ageAsString: "5 años, 8 meses",
            gender: .male,
            reservedDays: [.wed]
        )
    ))
}
