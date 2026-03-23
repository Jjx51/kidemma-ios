//
//  MainButtonModifier.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 23/03/26.
//

import Foundation
import SwiftUI

struct MainButtonModifier: ViewModifier{
    
    var radius: CGFloat = 10
    var backgroundColor: Color = Color("PrimaryButtonBackground")
    var width: CGFloat? // Parámetro opcional para el ancho
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: width)
            .background(backgroundColor)
            .cornerRadius(radius)
    }
}
