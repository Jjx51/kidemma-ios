//
//  HomeRoutes.swift
//  com.kidemma
//
//  Created by Leonardo González on 29/10/25.
//

import Foundation
import SwiftUI

enum HomeRoutes: Hashable {
    case classStatus
    case paymentStatus
    case reports
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .classStatus:
            Text("Class Status")
            
        case .paymentStatus:
            Text("Payment Status")
            
        case .reports:
            Text("Reports")
        }
    }
}
