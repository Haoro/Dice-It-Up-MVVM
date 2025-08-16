//
//  SessionCell.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 15/08/2025.
//

import SwiftUI

struct SessionCell: View {
    var session: Session
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 6) {
                
                // Both crit and fumble columns
                HStack {
                    // Critical - Left column
                    VStack {
                        Text("1 : \(session.omegaCritCount)")
                        Text("2-10 : \(session.critCount)")
                    }
                    // Fumble - Right Column
                    VStack {
                        Text("100 : \(session.omegaFumbleCount)")
                        Text("91-99 : \(session.fumbleCount)")
                    }
                }
                // Total rolls
                Text("Number of rolls : \(session.totalRolls)")
                    .font(.callout)
                    .italic()
                    .foregroundStyle(.primary)
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading) // Pin top content
    }
}

#Preview {
    SessionCell(session: Session(date: Date.now, rolls: [
        DiceRoll(input: "1d20", result: 20, comment: "Attack", timestamp: Int(Date().timeIntervalSince1970)),
        DiceRoll(input: "1d20", result: 1, comment: "Defense", timestamp: Int(Date().timeIntervalSince1970)),
        DiceRoll(input: "1d20", result: 15, comment: nil, timestamp: Int(Date().addingTimeInterval(-86400).timeIntervalSince1970))
    ]))
}
