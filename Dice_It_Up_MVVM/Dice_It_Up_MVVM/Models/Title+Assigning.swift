//
//  Title+Assigning.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

extension Title {
    
    /// Assign titles to a given list of Players
    /// - Parameter players: All the Players we want to compare their rolls.
    /// - Returns: The updated list of Players.
    static func assignTitles(to players: [Player]) -> [Player] {
        var updatedPlayers = players
        
        // Clear previously earned titles
        for i in updatedPlayers.indices {
            updatedPlayers[i].earnedTitles = []
        }
        
        // Iterate all titles
        for title in Title.all {
            // Build a dictionary: playerName -> total count for the rolls related to this title
            var playerScores: [String: Int] = [:]
            
            for player in updatedPlayers where player.name != "Haoro" {
                // Sum counts for all rollValues related to this title
                let totalCount = title.rollValues.reduce(0) { partialSum, rollValue in
                    partialSum + (player.rollsCount[rollValue] ?? 0)
                }
                playerScores[player.name] = totalCount
            }
            
            // Find max roll count
            guard let maxCount = playerScores.values.max(), maxCount > 0 else {
                // No rolls for this title's rolls => no one gets it
                continue
            }
            
            // Find players who have the maxCount
            let winners = playerScores.filter { $0.value == maxCount }.map { $0.key }
            print(winners, title.name, title.rollValues)
            
            // If only one winner, assign the title
            if winners.count == 1, let winnerIndex = updatedPlayers.firstIndex(where: { $0.name == winners.first }) {
                print("\(updatedPlayers[winnerIndex].name) est désormais :  \(title.name) (\(title.rollValues))")
                print("EFFET : \(title.description)")
                updatedPlayers[winnerIndex].earnedTitles.append(title)
            }
            // else: tie => no one gets the title
        }
        
        return updatedPlayers
    }
}
