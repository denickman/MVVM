//
//  Networking.swift
//  Medium-MVVM
//
//  Created by Denis Yaremenko on 01.05.2024.
//

import Foundation

protocol NetworkService {
    func fetchData() -> [String]
}


class Networking: NetworkService {
    func fetchData() -> [String] {
        return ["a", "b", "c"]
    }
}


