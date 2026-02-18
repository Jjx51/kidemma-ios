//
//  ChildAvatar.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 11/02/26.
//

import SwiftUI

struct ChildAvatar: View {
    let displayName: String
    let gender: String

    var body: some View {
            VStack {
                Image(gender == "female" ? .girl : .boy)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .background(.white)
                    .padding(12)
                    .clipShape(.circle)
                    .overlay(Circle().stroke(
                        Color("IconColor"),
                        lineWidth: 2
                    ))
                    .frame(width: 60, height: 60)
                Text(displayName)
                    .font(.caption)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ChildAvatar(displayName: "Daniel Robles López", gender: "male")
}
