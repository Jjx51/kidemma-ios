//
//  OptionItem.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 23/02/26.
//

import SwiftUI

struct OptionItem: View {
    let title: String
    let image: String
    
    var body: some View {
        HStack {
            Image(image).resizable().frame(width: 30, height: 30)
            Text(title).padding(.leading, 8)
            Spacer()
            Image(systemName: "chevron.right").resizable().frame(width: 20, height: 30)
        }
        .padding(24)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .padding(.horizontal, 5)
        .padding(.vertical, 8)
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    OptionItem(title: "Panel administrativo", image: "person.2.shield")
}
