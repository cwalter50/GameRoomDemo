//
//  DeveloperPreview.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/7/23.
//
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let samplePlayer1 = Player(id: "ABCDEF", name: "Doc", created: Double(Date().timeIntervalSince1970) - 20)
    let samplePlayer2 = Player(id: "123456", name: "Beth", created: Double(Date().timeIntervalSince1970) - 25)
    let samplePlayer3 = Player(id: "A1B2C3", name: "Bella", created: Double(Date().timeIntervalSince1970) - 50)
    let samplePlayer4 = Player(id: "QWERTY", name: "Luna", created: Double(Date().timeIntervalSince1970) - 100)


    var sampleRoom : Room {
        
        return Room(players: [samplePlayer1, samplePlayer2, samplePlayer3, samplePlayer4])
        
    }
}
