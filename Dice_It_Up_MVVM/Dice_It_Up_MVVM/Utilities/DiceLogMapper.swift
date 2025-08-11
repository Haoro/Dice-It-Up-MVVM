//
//  DiceLogMapper.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

/// Utility struct responsible for transforming raw dice logs into domain models.
struct DiceLogMapper {
    
    /// Groups dice logs by player and transforms them into `Player` models.
    /// - Parameter logs: Array of `DiceLogItem` fetched from the API.
    /// - Returns: Array of `Player` structs, each containing their related dice rolls.
    static func groupRollsByPlayer(from logs: [DiceLogItem]) -> [Player] {
        // Group the logs dictionary by the "from" field (player name)
        let grouped = Dictionary(grouping: logs) { $0.from ?? "Unknown" }
        
        // Map each player group into Player struct
        return grouped.map { (playerName, logs) in
            // Transform each DiceLogItem into a DiceRoll, filtering invalid entries
            let diceRolls = logs.compactMap { log -> DiceRoll? in
                guard let input = log.input,
                      let result = log.result,
                      let timestamp = log.time else {
                    // If essential fields are missing, skip this roll
                    return nil
                }
                // Create DiceRoll instance from raw log data
                return DiceRoll(
                    input: input,
                    result: result,
                    comment: log.comment,
                    timestamp: timestamp
                )
            }
            
            // Create and return Player with all rolls
            return Player(
                id: UUID(), // You could improve this by hashing playerName for stable IDs
                name: playerName,
                rolls: diceRolls,
                titles: []
            )
        }
    }
}
