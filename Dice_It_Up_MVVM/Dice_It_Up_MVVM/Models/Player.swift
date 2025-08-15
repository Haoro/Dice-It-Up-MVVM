//
//  Player.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

struct Player: Equatable, Identifiable, Hashable {
    let id: UUID
    /// The player's name
    let name: String
    
    /// All the player's dice rolls.
    var rolls: [DiceRoll]
    /// How much the player rolled wich number.
    let rollsCount: [Int: Int] // rollValue -> number of times rolled
    /// The title the player earned thanks to their rolls.
    var earnedTitles: [Title]
    /// The list of sessions a player played.
    let sessions: [Session]
    
    // Custom initializer, needed to capitalize the player's name.
    init(id: UUID = UUID(), name: String, rolls: [DiceRoll] = [], rollsCount: [Int:Int] = [:], earnedTitles: [Title] = []) {
        self.id = id
        self.name = name.capitalized          // Capitalize the name here
        self.rolls = rolls
        self.rollsCount = rollsCount
        self.earnedTitles = earnedTitles
    }
}
