//
//  Container.swift
//  Medium-MVVM
//
//  Created by Denis Yaremenko on 01.05.2024.
//

import Foundation
import Combine

class Container: ObservableObject {
    
    static let shared = Container()
    let networkService: NetworkService
    
    init(networkService: NetworkService = Networking()) {
        self.networkService = networkService
    }
}
