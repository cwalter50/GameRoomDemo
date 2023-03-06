//
//  ContentView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var roomCode: String = ""
    
    let deviceID =                     UIDevice.current.identifierForVendor?.uuidString ?? "No  Device ID Found"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack(alignment: .lastTextBaseline) {
                    TextField("Enter Room Code", text: $roomCode)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                        .textInputAutocapitalization(.characters)
                        .autocorrectionDisabled()
                    Button("Find Room") {
                        print(deviceID)
                    }
                }
                .font(.title2)
                
                Text("OR")
                NavigationLink("Create New Room", destination: CreateNewRoomView())
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
