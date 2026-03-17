//
//  PrevNextChevrons.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 19/02/26.
//

import SwiftUI

struct PrevNextChevrons<Value>: View {
    @Binding private var value: Value
    private let chevronsSize: Font
    private let onPrev: () -> Void
    private let onNext: () -> Void
    
    // 1) Generic sequential models (no extra parameter)
    init(
        value: Binding<Value>,
        chevronsSize: Font = .title,
        previous: @escaping (Value) -> Value,
        next: @escaping (Value) -> Value
    ) {
        self._value = value
        self.chevronsSize = chevronsSize
        
        let binding = value
        self.onPrev = { binding.wrappedValue = previous(binding.wrappedValue) }
        self.onNext = { binding.wrappedValue = next(binding.wrappedValue) }
    }
    
    // 2) Calendar-aware models (matches Week.previous/next)
    init(
        value: Binding<Value>,
        chevronsSize: Font = .title,
        calendar: Calendar = .current,
        previous: @escaping (Value) -> (Calendar) -> Value,
        next: @escaping (Value) -> (Calendar) -> Value
    ) {
        self._value = value
        self.chevronsSize = chevronsSize
        
        let binding = value
        self.onPrev = { binding.wrappedValue = previous(binding.wrappedValue)(calendar) }
        self.onNext = { binding.wrappedValue = next(binding.wrappedValue)(calendar) }
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Button(action: onPrev) {
                Image(systemName: "chevron.left")
                    .font(chevronsSize)
            }
            Button(action: onNext) {
                Image(systemName: "chevron.right")
                    .font(chevronsSize)
            }
        }
    }
}

#Preview("Prev/Next prints (generic binding)") {
    PrevNextChevrons(
        value: .constant(0),
        chevronsSize: .title,
        previous: { current in
            print("Prev chevron pressed")
            return current
        },
        next: { current in
            print("Next chevron pressed")
            return current
        }
    )
    .padding()
}
