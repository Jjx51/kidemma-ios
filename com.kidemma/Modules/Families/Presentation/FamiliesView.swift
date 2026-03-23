//
//  FamiliesView.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 20/03/26.
//

import SwiftUI

struct FamiliesView: View {
    @State var familytoSearch = ""
    var mockContent: [FamilyModel] = [
        FamilyModel(
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
        ),
        FamilyModel(
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
        ),
        FamilyModel(
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
    ]
    
    var body: some View {
        VStack{
            TopBar()
            VStack{
                SearchToolbar(termSearch: $familytoSearch)
                Button(action: {}){
                    Text("Crear Familia").modifier(TextButtonModifier())
                }
                .modifier(MainButtonModifier(width: .infinity))
                .padding(.top, 16)
                List(mockContent){ family in
                    FamilyComponent(family: family)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .listStyle(.plain)
                .padding(.vertical, 16)
                .padding(.top, 12)
                Spacer()
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
        }
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    FamiliesView()
}
