//
//  ContentView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var roomName: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Enter Room Name", text: $roomName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                Button("Find Room") {
                    
                }
                Text("OR")
                Button("Create New Room") {
                    
                }
                Spacer()
            }
            .font(.largeTitle)
            .navigationTitle("Game Room Demo")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
