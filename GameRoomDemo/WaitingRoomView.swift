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
        .navigationTitle("Waiting Room")
        .padding()
        .onAppear(perform: fetchPlayersFromFirebase)
        
    }
    
    
    
    func fetchPlayersFromFirebase()
    {
        let db = Firestore.firestore()
        
    db.collection("rooms").document("\(self.roomCode)").collection("players").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no players")
                return
        }
            print(documents)
        for doc in documents {
            let data = doc.data()
            let name = data["name"] as? String ?? "No Name"
            let id = data["id"] as? String ?? "No ID FOUND"
            let created = data["created"] as? Double ?? Double(Date().timeIntervalSince1970)
            
            let player = Player(id: id, name: name, created: created)
            self.room.players.append(player)
            print("Found player: \(player.name) \(player.id)")
        }
            
            
//                        self.room.players = documents.map { queryDocumentSnapshot -> Player in
//                        return Player(document: queryDocumentSnapshot)
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
