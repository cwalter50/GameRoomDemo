//
//  Room.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//


import SwiftUI


class Room: Identifiable, ObservableObject
{
    @Published var id: String // This is the roomCode
    @Published var roomName: String
    @Published var created: Double // this is the time the room was created. Can use this to sort, if we display different rooms...
    @Published var players: [Player] // a player contains a device id that links them to a name
    
    init(id: String = "ABCDEF", roomName: String = "Avengers", players: [Player] = [], created: Double = Double(Date().timeIntervalSince1970)) {
        self.id = id
        self.roomName = roomName
        self.players = players
        self.created = created
    }
    
    func toDictionaryValues() -> [String: Any]
    {
        return ["roomName": self.roomName, "roomCode": self.id, "created": self.created]
    }
    
    
}
