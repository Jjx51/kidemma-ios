//
//  WeekPickerSheet.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 19/02/26.
//

import SwiftUI

struct WeekPickerSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var week: Week
    
    var body: some View {
        NavigationStack {
            DatePicker(
                "Select week",
                selection: Binding<Date>(
                    get: { week.start },
                    set: { newDate in
                        week = Week.containing(newDate)
                    }
                ),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding()
            .navigationTitle("Select Week")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    StatefulPreviewWrapper(Week.containing(Date())) { week in
        WeekPickerSheet(week: week)
    }
}
