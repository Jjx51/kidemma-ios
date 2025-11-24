//
//  MainViewModel.swift
//  com.kidemma
//
//  Created by j.servin.garcia on 27/10/25.
//

import Foundation

class MainViewModel {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getData() -> String {
        return networkService.fetchData()
    }
}
