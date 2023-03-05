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
    
    init(roomCode: String)
    {
        self.roomCode = roomCode
        // load room from roomCode
        self.room = Room()
    }
    var body: some View {
        VStack {
            Text("Test Room")
            
            
        }.navigationTitle("Waiting Room")
        .padding()
        
    }
}

struct WaitingRoomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WaitingRoomView(roomCode: "TestRoom")
        }
        
    }
}
