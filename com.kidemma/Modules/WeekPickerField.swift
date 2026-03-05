//
//  WeekPickerField.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 19/02/26.
//

import SwiftUI

struct WeekPickerField: View {
    @Binding var week: Week
    @State private var showPicker = false
    
    private let cornerRadius: CGFloat = 12
    private let height: CGFloat = 50
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width * 0.60
            
            Button {
                showPicker = true
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "calendar")
                        .foregroundStyle(.secondary)
                    
                    // ✅ Cross-month label style
                    Text(week.label(style: .rangeMonths))
                        .foregroundStyle(.primary)
                        .font(.system(size: 16, weight: .semibold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.85)
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 14)
                .frame(width: width, height: height)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                                .stroke(Color.black.opacity(0.08), lineWidth: 1)
                        )
                )
                .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: height)
        .sheet(isPresented: $showPicker) {
            WeekPickerSheet(week: $week)
        }
        .accessibilityLabel("Select week")
    }
}

#Preview {
    StatefulPreviewWrapper(Week.containing(Date())) { week in
        VStack(spacing: 16) {
            WeekPickerField(week: week)
            Text("The items below are for demonstration purposes only.")
                .font(.caption)
            PrevNextChevrons(
                value: week,
                chevronsSize: .title,
                previous: { $0.previous() },
                next: { $0.next() }
            )

            HStack(spacing: 12) {
                Button("Previous") { week.wrappedValue = week.wrappedValue.previous() }
                Button("Next") { week.wrappedValue = week.wrappedValue.next() }
            }
            .buttonStyle(.bordered)
            
            Text("Start: \(week.wrappedValue.start.formatted(date: .long, time: .omitted))")
                .font(.caption)
            Text("End: \(week.wrappedValue.end.formatted(date: .long, time: .omitted))")
                .font(.caption)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
