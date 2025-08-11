//
//  DiceRoll.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

struct DiceRoll: Equatable, Identifiable {
    let id: UUID = UUID()
    let input: String
    let result: String
    let comment: String?
    let timestamp: Int
    /// Retourne la date "de session" en considérant que les jets faits entre minuit et 6h sont du jour précédent.
    var sessionDate: Date {
        let originalDate = Date(timeIntervalSince1970: TimeInterval(timestamp))
        return Calendar.current.date(byAdding: .hour, value: -6, to: originalDate)!
    }
}
