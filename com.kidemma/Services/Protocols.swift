//
//  Protocols.swift
//  com.kidemma
//
//  Created by j.servin.garcia on 27/10/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData() -> String
}

protocol DatabaseServiceProtocol {
    func saveData()
}
