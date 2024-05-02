//
//  ViewModel.swift
//  Medium-MVVM
//
//  Created by Denis Yaremenko on 02.05.2024.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var receivedText: String = ""

    // Define a PassthroughSubject that emits String values
    let textSubject = PassthroughSubject<String, Never>()

    func sendData(_ text: String) {
        // Send the text value through the PassthroughSubject
        textSubject.send(text)
    }
}
