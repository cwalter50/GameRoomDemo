//
//  CreateNewRoomView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI

struct CreateNewRoomView: View {
    @State var roomName: String = ""
    
    @State var roomCode: String
    
    @State var userName: String = ""
    
    init()
    {
        let uuid = UUID().uuidString
        let index = uuid.index(uuid.startIndex, offsetBy: 6)
        roomCode = String(uuid[..<index])
    }
        
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Room Name: ")
                TextField("Enter Room Name", text: $roomName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .font(.headline)
            }
            HStack {
                Text("Room Code: ")
                Spacer()
                Text(roomCode)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
                Button {
                    getNewRoomCode()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
            HStack {
                Text("Your Name: ")
                TextField("Enter Your Name", text: $userName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .font(.headline)
            }
            Button("Start Room")
            {
                startRoom()
            }
            .disabled(roomName == "" || userName == "")
            Spacer()
            
        }
        .padding()
        .font(.title)
        
    }
    
    func startRoom()
    {
        
    }
    
    func getNewRoomCode()
    {
        let uuid = UUID().uuidString
        let index = uuid.index(uuid.startIndex, offsetBy: 6)
        roomCode = String(uuid[..<index])
    }
}

struct CreateNewRoomView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewRoomView()
    }
}
