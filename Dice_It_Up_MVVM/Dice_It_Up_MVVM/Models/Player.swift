//
//  Player.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

struct Player: Equatable, Identifiable, Hashable {
    let id: UUID
    let name: String
    var rolls: [DiceRoll]
    let rollsCount: [Int: Int] // rollValue -> number of times rolled
    var earnedTitles: [Title] = []
}
