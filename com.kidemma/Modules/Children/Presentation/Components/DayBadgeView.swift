//
//  DayBadgeView.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 12/02/26.
//

import SwiftUI

import SwiftUI

struct DayBadgeView: View {
    let isSelected: Bool
    let weekDay: WeekDay // mon tue wed thu fri sat sun
    
    var body: some View {
        Text(weekDay.rawValue)
            .font(.subheadline)
            .fontWeight(.heavy)
            .foregroundColor(isSelected ? .title : .disabledButtonText)
            .frame(width: 20, height: 20)
            .background(
                Circle().fill(isSelected ? .background : .disabledButtonBackground)
            )
            .overlay(
                Circle().stroke(isSelected ? .title : .disabledButtonBackground, lineWidth: isSelected ? 2 : 0)
            )
            .accessibilityLabel(Text("Day \(weekDay)"))
    }
}

#Preview {
    DayBadgeView(isSelected: true, weekDay: .mon)
}
