//
//  DayButton.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 26/02/26.
//

import SwiftUI

struct DayButton: View {
    let isActive: Bool
    let date: Date
    private let calendar = Calendar.current
    
    private var day: Int {
        calendar.component(.day, from: date)
    }
    
    var body: some View {
        VStack {
            Text("Today is \(day)")
            
            Button {
                // action
            } label: {
                Text("\(day)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(isActive ? Color(.icon) : .black)
                    .padding()
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .stroke(
                            isActive ? Color(.icon) : .clear,
                            lineWidth: 4
                        )
                    )
            }
            .background(.whiteBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .background(.backgroundCard)
    }
}

#Preview {
    DayButton(isActive: true, date: Date())
    DayButton(isActive: false, date: Date())
}
