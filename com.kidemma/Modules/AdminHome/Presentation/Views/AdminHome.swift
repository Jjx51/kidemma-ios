//
//  AdminHome.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 11/02/26.
//

import SwiftUI

struct AdminHome: View {
    @AppStorage("app.language") private var languageCode: String = "system"
    private var appLanguage: AppLanguage { AppLanguage(rawValue: languageCode) ?? .system }

    private var mockContent: [SectionModel] {
        [
            SectionModel(
                image: "ic_status",
                title: L10n.string("admin.status.classes", bundle: appLanguage.bundle),
                items: [
                    SectionItem(
                        icon: "ic_warning",
                        title: L10n.string("admin.status.classes.possibleCancellations", bundle: appLanguage.bundle),
                        count: 10
                    ),
                    SectionItem(
                        icon: "ic_danger",
                        title: L10n.string("admin.status.classes.finalCancellations", bundle: appLanguage.bundle),
                        count: 5
                    )
                ]
            ),
            SectionModel(
                image: "ic_payment_status",
                title: L10n.string("admin.status.payments", bundle: appLanguage.bundle),
                items: [
                    SectionItem(
                        title: L10n.string("admin.payments.pending", bundle: appLanguage.bundle),
                        count: 10
                    ),
                    SectionItem(
                        title: L10n.string("admin.payments.overdue", bundle: appLanguage.bundle),
                        count: 5
                    ),
                    SectionItem(
                        title: L10n.string("admin.payments.toApprove", bundle: appLanguage.bundle),
                        count: 2
                    )
                ]
            ),
            SectionModel(
                image: "ic_complaints",
                title: L10n.string("admin.complaints.title", bundle: appLanguage.bundle),
                items: [
                    SectionItem(
                        title: L10n.string("admin.complaints.pending", bundle: appLanguage.bundle),
                        count: 10
                    ),
                    SectionItem(
                        title: L10n.string("admin.complaints.deactivated", bundle: appLanguage.bundle),
                        count: 5
                    )
                ]
            )
        ]
    }
    
    var body: some View {
        VStack {
            List(mockContent) { section in
                SectionContainer(
                    sectionModel: section
                )
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .listStyle(.plain)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .background(Color("BackgroundColor"))
        
    }
}

#Preview {
    AdminHome()
}
