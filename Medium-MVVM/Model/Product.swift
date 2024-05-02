//
//  Product.swift
//  Medium-MVVM
//
//  Created by Denis Yaremenko on 01.05.2024.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let category: String
}
