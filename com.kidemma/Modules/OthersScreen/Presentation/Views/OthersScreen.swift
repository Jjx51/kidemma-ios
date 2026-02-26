//
//  OthersScreen.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 23/02/26.
//

import SwiftUI

struct OthersScreen: View {
    let roll: String = "Admin"
    var mockContent = [
        (image: "ic_who_we_are", title: "¿Quiénes somos?"),
        (image: "ic_staff", title: "Personal de trabajo"),
        (image: "ic_contact", title: "Contacto y ubicación"),
        (image: "ic_alliances", title: "Alianzas"),
        (image: "ice_feedback", title: "Foro"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            if(roll == "Admin"){
                OptionItem(title: "Panel administrativo", image: "ic_admin_dashboard")
            }
            Text("Enlaces públicos").font(Font.title2.bold())
                
            List(mockContent, id: \.title) { section in
                OptionItem(title: section.title, image: section.image)
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
    OthersScreen()
}
