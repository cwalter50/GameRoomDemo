//
//  ContentView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var roomCode: String = ""
    
    @State var room: Room = Room()
    
    @State var foundRoom = false // triger segue to signinview
    
    @State var showErrorAlert = false
    
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
                        findRoomOnFirebase()
                    }
                }
                .font(.title2)
                NavigationLink(destination: SignInView(room: self.room), isActive: $foundRoom) { EmptyView() }
                Text("OR")
                NavigationLink("Create New Room", destination: CreateNewRoomView())
                Spacer()
            }
            .font(.largeTitle)
            .navigationTitle("Game Room Demo")
            .alert(isPresented: $showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("No room found with code: \(roomCode)"),
                    dismissButton: .default(Text("OK")){
                        roomCode = ""
                    }
                )
            }
            
        }
        .padding()
        

    }
    
    
    func findRoomOnFirebase()
    {
        let db = Firestore.firestore()
        db.collection("rooms").document("\(roomCode)").getDocument { (snapshot, error) in
            if let err = error {
                print("Error finding snapshot: \(err)")
                return
            }
            if let document = snapshot, let data = document.data() {
                // get the data from the [String: Any]
                let roomName = data["roomName"] as? String ?? "No Name Found"
                let id = data["roomCode"] as? String ?? "No ID Found"
                let created = data["created"] as? Double ?? Double(Date().timeIntervalSince1970)
                // Create the room
                self.room = Room(id: id, roomName: roomName, players: [], created: created)
                self.foundRoom.toggle() // this will trigger a segue to SignInView
            }
            else {
                showErrorAlert.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
