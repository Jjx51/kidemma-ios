//
//  AvatarImageModifier.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 23/03/26.
//

import Foundation
import SwiftUI

extension Image {
    func avatarStyle(size: CGFloat = 50) -> some View {
        self
            .resizable()
            .foregroundStyle(.black)
            .background(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color("IconColor"), lineWidth: 2)
            )
            .frame(width: size, height: size)
            .padding(2)
    }
}
