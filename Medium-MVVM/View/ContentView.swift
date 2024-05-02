//
//  ContentView.swift
//  Medium-MVVM
//
//  Created by Denis Yaremenko on 01.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @ObservedObject var user: User
    @EnvironmentObject var container: Container
        
    ///  The ContentView holds an instance of ViewModel as an observed object. This means any changes to the properties marked with @Published in the ViewModel will cause the ContentView to re-render.
    @ObservedObject var viewModel = ViewModel()
    @State private var text = ""
    
    let data: [String]

    // MARK: - Body
    
    var body: some View {
        VStack {
            TextField("Name", text: $user.name)
                .padding()
            Text("Hello \(user.name)")
                .padding()
        }
        
        List(data, id: \.self) { item in
            Text(item)
        }

        List(container.networkService.fetchData(), id: \.self) { item in
            Text(item)
        }
        .padding()
        Spacer()
        VStack {
            /// Text field for user input
            /// When a user enters text into the TextField, the text property bound to it using $text gets updated with the new value.
            TextField("Enter text", text: $text)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: text) { newText in
                    // Send the updated text to the view model
                    viewModel.sendData(newText)
                }

            // Display text received from the view model
            Text("Received text: \(viewModel.receivedText)")
        }
        .padding()
        .onReceive(viewModel.textSubject) { receivedText in
            // Update the receivedText property whenever a new value is received
            viewModel.receivedText = receivedText
        }
        Spacer()
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        let user = User()
        let data = ["a", "b", "c"]
        ContentView(user: user, data: data)
    }
}
