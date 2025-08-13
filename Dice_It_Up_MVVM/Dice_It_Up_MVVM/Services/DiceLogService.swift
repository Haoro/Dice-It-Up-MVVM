//
//  DiceLogService.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

/// Represents a single dice log item from the API.
struct DiceLogItem: Decodable, Equatable {
    let type: String            // Type of message (e.g. "dicemsg").
    let comment: String?        // Optional comment attached to the roll.
    let input: String?          // The dice input string (e.g. "d100 #roulade").
    let result: String?         // Result of the dice roll as a string.
    let from: String?           // Player or user who rolled the dice.
    let time: Int?              // Unix timestamp (seconds since 1970).
}

/// Root response for dice logs from the API.
struct DiceLogResponse: Decodable {
    let items: [DiceLogItem]
}

// MARK: - Protocol for easier testing and DI (Dependency Injection)
protocol DiceLogServiceProtocol {
    /// Fetch dice logs from API for a specific group.
    func fetchDiceLogs(for group: String) async throws -> [DiceLogItem]
}

// MARK: - Service responsible only for fetching and decoding data from the API.
struct DiceLogService: DiceLogServiceProtocol {
    
    /// Fetch dice logs for the specified group asynchronously.
    /// - Parameter group: The group identifier to fetch logs for.
    /// - Returns: An array of DiceLogItem decoded from JSON.
    func fetchDiceLogs(for group: String) async throws -> [DiceLogItem] {
        // Construct the URL with group parameter
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
//            throw URLError(.badURL)
//        }
        guard let url = URL(string: "https://rolz.org/api/roomlog?room=\(group)") else {
            throw URLError(.badURL)
        }
        
        // Perform network request asynchronously.
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode the JSON response into model objects.
        let decoder = JSONDecoder()
        let response = try decoder.decode(DiceLogResponse.self, from: data)
        
        // Filter only items where :
        //   - type is "dicemsg".
        //   - input starts with d100 (to not count any results that may be from other dice).
        let diceMessages = response.items.filter { item in
            item.type == "dicemsg" && (item.input?.hasPrefix("d100") ?? false)
        }
        return diceMessages
        
        // Decode JSON data into array of DiceLogItem
        //let decoder = JSONDecoder()
        // Important: API returns an object with a key "messages" holding array?
        // Adjust decoding accordingly, here assuming the API returns [DiceLogItem] directly.
        // If the structure is different, decode the root object and extract array accordingly.
        
        // For example, if API returns {"messages": [...]}, define a wrapper struct:
//        struct ResponseWrapper: Decodable {
//            let messages: [DiceLogItem]
//        }
        
        // Decode the wrapper, then extract messages
//        let wrapper = try decoder.decode(ResponseWrapper.self, from: data)
//        return wrapper.messages
    }
}
