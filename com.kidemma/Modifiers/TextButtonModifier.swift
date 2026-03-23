//
//  TextButtonModifier.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 23/03/26.
//

import Foundation
import SwiftUI

struct TextButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.title3.bold())
            .foregroundStyle(Color("PrimaryButtonText"))
    }
}
