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
    
    private func colorForIndex(_ index: Int) -> Color {
        colors[index % colors.count]
    }
    
    var body: some View {
        VStack {
            HStack{
                Image(sectionModel.image)
                Text(sectionModel.title).font(Font.title3.bold())
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
                        Spacer()
                        Text("\(item.count)")
                            .font(Font.title3)
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
        )
    )
}
