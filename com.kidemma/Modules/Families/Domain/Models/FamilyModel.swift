//
//  FamilyModel.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 23/03/26.
//

import Foundation

struct FamilyModel: Identifiable {
    let id = UUID()
    let familyName: String
    var familyAlias: String?
    var familyMembers: [FamilyMemberModel]
    
}

struct FamilyMemberModel: Identifiable {
    let id = UUID()
    let name: String
    var age: Int
    var imageUrl: String?
    let imageDefault: String
}
