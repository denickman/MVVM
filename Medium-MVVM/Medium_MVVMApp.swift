//
//  Medium_MVVMApp.swift
//  Medium-MVVM
//
//  Created by Denis Yaremenko on 01.05.2024.
//

import SwiftUI

@main
struct Medium_MVVMApp: App {
    
    // @StateObject property wrapper is used to manage the lifecycle of an observable object within a view. It ensures that the object is persisted across view updates and is recreated only when the view itself is reinitialised.
    
    @StateObject private var container = Container.shared

    var body: some Scene {
        WindowGroup {
            ContentView(user: User(), data: ["a", "b", "c"])
                .environmentObject(container)
        }
    }
}
