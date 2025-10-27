//
//  DependencyContainer.swift
//  com.kidemma
//
//  Created by j.servin.garcia on 27/10/25.
//

import Foundation

class DependencyContainer {
    let networkService: NetworkServiceProtocol
    let databaseService: DatabaseServiceProtocol
    
    init() {
        self.networkService = NetworkService()
        self.databaseService = DatabaseService()
    }
    
    func makeMainViewModel() -> MainViewModel {
        return MainViewModel(networkService: networkService)
    }
}
