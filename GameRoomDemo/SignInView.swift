//
//  SignInView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI
import Firebase

struct SignInView: View {
    
    var room: Room
    @State var playerName: String = ""
    @State var isPlayerSaved = false

    var body: some View {
        VStack {
            Text(room.roomName)
                .font(.largeTitle)
            HStack {
                Text("Room Code:")
                Spacer()
                Text(room.id)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
            }
            .font(.title)
            HStack {
                Text("Your Name: ")
                    .font(.title)
                TextField("Enter Your Name", text: $playerName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .font(.body)
            }
            Button("Join Room")
            {
                addPlayerToRoom()
            }
            .font(.largeTitle)
            .disabled(playerName == "")
            
            Spacer()
            NavigationLink(destination: WaitingRoomView(room: self.room), isActive: $isPlayerSaved) { EmptyView() }
        }
        .padding()
        
    }
    
    
    func addPlayerToRoom()
    {
        let deviceID =                     UIDevice.current.identifierForVendor?.uuidString ?? "No  Device ID Found"
        let player = Player(id: deviceID, name: self.playerName, created: Double(Date().timeIntervalSince1970))
        
        let db = Firestore.firestore().collection("rooms").document("\(room.id)").collection("players").document("\(deviceID)")
        
        let theData = player.toDictionaryValues()
        db.setData(theData) {
            err in
            if let error = err {
                print("Error saving player to room: \(error)")
            }
            else {
                print("player saved successfully")
                isPlayerSaved.toggle() // this will trigger navigation to the waiting room.
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(room: Room())
    }
}
