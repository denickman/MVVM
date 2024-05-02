//
//  ProductListViewModel.swift
//  Medium-MVVM
//
//  Created by Denis Yaremenko on 01.05.2024.
//

import Foundation
import Combine


/*
 ObservableObject is a protocol provided by the Combine framework, used to create objects whose changes can be observed. Objects conforming to ObservableObject can be used in SwiftUI to automatically update the user interface whenever their @Published properties change.

 Now, @Published is a property wrapper provided by SwiftUI. When applied to a property inside a class that conforms to ObservableObject, it automatically synthesizes the necessary code to publish changes to that property. This means that any time the value of a property marked with @Published changes, it notifies any views observing that object, triggering an update of the user interface.

 In short, ObservableObject and @Published work together to enable SwiftUI views to react to changes in the data model.
 */

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = productsData
    @Published var categories: [String] = []
    @Published var selectedCategory: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        self.categories = Set(products.map {
            $0.category
        }).sorted()
        
        $selectedCategory.sink { [weak self] category in
            self?.filterProducts(by: category)
        }.store(in: &cancellables)
    
    }
    
    private func filterProducts(by category: String) {
        if category.isEmpty {
            products = []
        } else {
            products = products.filter { $0.category == category }
        }
    }
}


class User: ObservableObject {
    @Published var name: String = ""
}
