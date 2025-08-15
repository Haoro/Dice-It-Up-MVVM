//
//  Session.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 15/08/2025.
//

import Foundation

/// Representss a session for a givent date played by a given player.
struct Session: Identifiable, Equatable, Hashable {
    let id: UUID = UUID()
    /// The date the session was played.
    let date: Date
    /// All the player's roll for that session.
    let rolls: [DiceRoll]
    
    /// Number of 1 a player did for this session.
    var omegaCritCount: Int { rolls.filter { $0.result == 1 }.count }
    /// Number of 2-10 a player did for this session.
    var critCount: Int { rolls.filter { $0.result >= 2 && $0.result <= 10 }.count }
    /// Number of 91-99 a player did for this session.
    var fumbleCount: Int { rolls.filter { $0.result >= 91 && $0.result <= 99 }.count }
    /// Number of 100 a player did for this session.
    var omegaFumbleCount: Int { rolls.filter { $0.result == 100 }.count }
    /// Number of rolls a player did for this sessions.
    var totalRolls: Int { rolls.count }
}
