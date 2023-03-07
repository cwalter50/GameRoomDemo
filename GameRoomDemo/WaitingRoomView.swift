//
//  WaitingRoomView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI
import Firebase

struct WaitingRoomView: View {
    
    @ObservedObject var room: Room
    var roomCode: String
    
    init(room: Room)
    {
        self.room = room
        self.roomCode = room.id
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Room Name:")
                Spacer()
                Text(room.roomName)
                    .fontWeight(.bold)
                    
            }
            .font(.title)
            HStack {
                Text("Room Code:")
                Spacer()
                Text(room.id)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
            }
            .font(.title)
            VStack {
                Text("PLAYERS")
                    .font(.title)
                    .fontWeight(.bold)
                Divider()
                List
                {
                    ForEach(room.players) { player in
                        HStack {
                            Text("\(player.name)")
                            Text("\(player.id)")
                        }
                    }
                }
                .listStyle(.plain)
            }
            .padding(.top, 20)
        }
        .navigationTitle("Waiting Room")
        .padding()
        .onAppear(perform: fetchPlayersFromFirebase)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Play") {
                    // ToDo: Figure out What game to play. and how to play it...
                }.font(.title)
            }
        }
        
    }
    
    
    
    func fetchPlayersFromFirebase()
    {
        let db = Firestore.firestore()
        
        db.collection("rooms").document("\(self.roomCode)").collection("players").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no players")
                return
            }

            self.room.players.removeAll() // this will remove duplicates
            for doc in documents {
                let data = doc.data()
                let name = data["name"] as? String ?? "No Name"
                let id = data["id"] as? String ?? "No ID FOUND"
                let created = data["created"] as? Double ?? Double(Date().timeIntervalSince1970)

                let player = Player(id: id, name: name, created: created)
                self.room.players.append(player)
                print("Found player: \(player.name) \(player.id)")
            }
            
        }
    }
    
}

struct WaitingRoomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WaitingRoomView(room: dev.sampleRoom)
        }
        
    }
}
