//
//  SectionContainer.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 11/02/26.
//

import SwiftUI

struct SectionContainer: View {
    let sectionModel : SectionModel
    private let colors: [Color] = [Color("Focus"), Color("IconColor"), Color("StatusWarning")]
    @AppStorage("app.language") private var languageCode: String = "system"
    private var appLanguage: AppLanguage { AppLanguage(rawValue: languageCode) ?? .system }
    
    private func colorForIndex(_ index: Int) -> Color {
        colors[index % colors.count]
    }
    
    var body: some View {
        VStack {
            HStack{
                Image(sectionModel.image)
                Text(sectionModel.title)
                    .font(Font.title3.bold())
                    .accessibilityLabel(L10n.key("section.title", bundle: appLanguage.bundle, defaultValue: "Section title"))
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.top, 16)
            Divider()
            ForEach(Array(sectionModel.items.enumerated()), id: \.element.id) { index, item in
                VStack {
                    HStack {
                        if item.icon != nil {
                            Image(item.icon!)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.trailing, 16)
                        }
                        Text(item.title)
                            .font(Font.title3.bold())
                            .foregroundColor(item.icon == nil ? colorForIndex(index) : .black)
                            .listRowSeparator(.visible)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                            .accessibilityLabel(L10n.key("section.item.title", bundle: appLanguage.bundle, defaultValue: "Item title"))
                        Spacer()
                        Text("\(item.count)")
                            .font(Font.title3)
                            .accessibilityLabel(L10n.key("section.item.count", bundle: appLanguage.bundle, defaultValue: "Count"))
                    }.padding(.leading, 24).padding(.trailing, 10)
                    Divider()
                }
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .padding(.horizontal, 5)
        .padding(.vertical, 8)
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    SectionContainer(
        sectionModel: SectionModel(
            image: "ic_complaints",
            title: L10n.string("admin.complaints.title"),
            items: [
                SectionItem(
                    title: L10n.string("admin.complaints.pending"),
                    count: 10
                ),
                SectionItem(
                    title: L10n.string("admin.complaints.deactivated"),
                    count: 5
                )
            ]
        )
    )
}
