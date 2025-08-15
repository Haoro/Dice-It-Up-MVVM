//
//  DiceRoll.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

struct DiceRoll: Equatable, Identifiable, Hashable {
    let id: UUID = UUID()
    /// What the player prompted.
    let input: String
    /// The roll's result.
    let result: Int
    /// Which action the roll was for ?
    let comment: String?
    /// The precise time of the roll.
    let timestamp: Int
    /// The session's date.
    /// Note that rolls are considered from the previous day when made from midnight till 6 hours later.
    var sessionDate: Date {
        let originalDate = Date(timeIntervalSince1970: TimeInterval(timestamp))
        return Calendar.current.date(byAdding: .hour, value: -6, to: originalDate)!
    }
}
