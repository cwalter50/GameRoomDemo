//
//  SignInView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI

struct SignInView: View {
    
    var room: Room
    @State var playerName: String = ""

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
                    .font(.title2)
            }
            Button("Join Room")
            {
                
            }
            .font(.largeTitle)
            .disabled(playerName == "")
            Spacer()
        }
        .padding()
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(room: Room())
    }
}
