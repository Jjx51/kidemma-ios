//
//  TopBar.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 10/02/26.
//

import SwiftUI

struct TopBar: View {
    //TODO: Use the real username
    var userName: String = "Alfredo"
    @AppStorage("app.language") private var languageCode: String = "system"
    private var appLanguage: AppLanguage { AppLanguage(rawValue: languageCode) ?? .system }
    
    var body: some View {
        HStack {
            Text(String(userName.prefix(1)))
                .accessibilityLabel(L10n.key("topbar.user.initial", bundle: appLanguage.bundle, defaultValue: "User initial"))
                .padding(18)
                .background(Color("BackgroundCard"))
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color("IconColor"), lineWidth: 2)
                )
            Image("ic_kidemma_topbar")
                .accessibilityLabel(L10n.key("topbar.logo", bundle: appLanguage.bundle, defaultValue: "App logo"))
            Spacer()
            Image("ic_notifications")
                .accessibilityLabel(L10n.key("topbar.notifications", bundle: appLanguage.bundle, defaultValue: "Notifications"))
        }
        .padding(.horizontal, 20)
        .background(.white)
    }
}

#Preview {
    TopBar()
}
