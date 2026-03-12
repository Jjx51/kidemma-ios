//
//  ChildCard.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 12/02/26.
//

import SwiftUI

struct ChildCard: View {
    @State var child: Child
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ChildInfo(child: $child)
                Divider()
                    .foregroundColor(Color("Divisor"))
                VStack(alignment: .leading) {
                    Text("Clases")
                        .font(.headline)
                    HStack(spacing: 10) {
                        ForEach(WeekDay.allCases, id: \.self) { d in
                            DayBadgeView(isSelected: child.reservedDays.contains(d) ? true : false, weekDay: d)
                        }
                    }
                }
                .padding(.horizontal, 14)
            }
            .padding()
            .background(Color("WhiteBackground"))
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 3, x: 0, y: 3)
        }
        .padding(.horizontal, 28)
    }
}

#Preview {
    ChildCard(child: Child(
        name: "Daniel Robles López",
        ageAsString: "5 años, 8 meses",
        gender: .male,
        reservedDays: [.wed]
    ))
}
