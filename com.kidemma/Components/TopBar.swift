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
    
    var body: some View {
        HStack {
            Text(String(userName.prefix(1)))
                .padding(18)
                .background(Color("BackgroundCard"))
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color("IconColor"), lineWidth: 2)
                )
            Image("ic_kidemma_topbar")
            Spacer()
            Image("ic_notifications")
        }
        .padding(.horizontal, 20)
        .background(.white)
    }
}

#Preview {
    TopBar()
}
