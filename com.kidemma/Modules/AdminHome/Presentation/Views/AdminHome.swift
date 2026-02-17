//
//  AdminHome.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 11/02/26.
//

import SwiftUI

struct AdminHome: View {
    var mockContent: [SectionModel] = [
        SectionModel(
            image: "ic_status",
            title: "Estatus de clases",
            items: [
                SectionItem(
                    icon: "ic_warning",
                    title: "Posibles cancelaciones",
                    count: 10
                ),
                SectionItem(
                    icon: "ic_danger",
                    title: "Cancelaciones definitivas",
                    count: 5
                ),
            ]
        ),
        SectionModel(
            image: "ic_payment_status",
            title: "Estatus de pagos",
            items: [
                SectionItem(
                    title: "Pagos pendientes",
                    count: 10
                ),
                SectionItem(
                    title: "Pagos vencidos",
                    count: 5
                ),
                SectionItem(
                    title: "Pagos por aprobar",
                    count: 2
                )
            ]
        ),
        SectionModel(
            image: "ic_complaints",
            title: "Denuncias",
            items: [
                SectionItem(
                    title: "Pendinete",
                    count: 10),
                SectionItem(
                    title: "Desactivados",
                    count: 5
                )
            ]
        ),
    ]
    
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
