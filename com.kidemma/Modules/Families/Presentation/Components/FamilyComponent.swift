//
//  FamilyComponent.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 23/03/26.
//

import SwiftUI

struct FamilyComponent: View {
    let family: FamilyModel
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Familia: \(family.familyName)")
                    .font(Font.title3.bold())
                if family.familyAlias != nil {
                    Text("Alias: \(family.familyAlias!)")
                        .font(Font.title3)
                        .padding(.vertical, 5)
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(family.familyMembers, id: \.self.id) { member in
                            Image(member.imageDefault)
                                .avatarStyle()
                                
                        }
                    }
                }
            }
            Spacer()
            Image(systemName: "arrow.right")
                .bold()
                .foregroundStyle(Color("IconColor"))
        }
        .padding(.vertical,16)
        .padding(.horizontal, 24)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .padding(.horizontal, 5)
        .padding(.vertical, 8)
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    FamilyComponent(
        family: FamilyModel(
            familyName: "Hernández Mendoza",
            familyAlias: "La perrona",
            familyMembers: [
                FamilyMemberModel(
                    name: "Leonardo",
                    age: 28,
                    imageDefault: "father"),
                FamilyMemberModel(
                    name: "Damaris",
                    age: 29,
                    imageDefault: "mother"),
                FamilyMemberModel(
                    name: "Luis",
                    age: 2,
                    imageDefault: "boy"),
            ]
        )
    )
}
