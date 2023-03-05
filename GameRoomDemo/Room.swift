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
    @Published var userNames: [String] // this dataType should change to [User], once you figure out how to create a user...
    @Published var created: Double // this is the time the room was created. Will use this to sort, if we display different rooms...
    
    init(id: String = UUID().uuidString, roomName: String = "Dr. Peterson", userNames: [String] = [], created: Double = Double(Date().timeIntervalSince1970)) {
        self.id = id
        self.roomName = roomName
        self.userNames = userNames
        self.created = created
        
    }
    
    
}
