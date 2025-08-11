//
//  PlayersViewModel.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

/// ViewModel responsible for managing the list of players and their dice rolls.
@MainActor
class PlayersViewModel: ObservableObject {
    
    // MARK: Init Properties
    let group: Group
    
    // MARK: - Published Properties
    // Published property containing the list of players to display
    @Published var players: [Player] = []
    
    // Loading state to show activity indicator or disable UI
    @Published var isLoading: Bool = false
    
    // Optional error message to display to the user
    @Published var errorMessage: String? = nil
    
    // Service injected to fetch dice logs (allows easy mocking/testing)
    private let service: DiceLogServiceProtocol
    
    // MARK: - Init
    /// Init the PlayersView by loading all the players found by using the Group's url.
    init(group: Group) {
        self.group = group
        self.service = DiceLogService()
    }
    
    // TODO: Check how to test using mocks.
    /// Initialize with default service or injected mock for testing.
//    init(service: DiceLogServiceProtocol = DiceLogService()) {
//        self.service = service
//    }
    
    // MARK: - Public Methods
    func loadMockPlayers() {
        self.players = [
            Player(id: UUID(), name: "Jora", rolls: [], titles: []),
            Player(id: UUID(), name: "Nikolai", rolls: [], titles: []),
            Player(id: UUID(), name: "Louis", rolls: [], titles: []),
        ]
    }
    
    /// Fetch dice logs for a given group asynchronously,
    /// transform the logs into players, and update the published properties.
    /// - Parameter group: The group identifier string to fetch logs for.
    func fetchData() async {
        // Start loading state
        isLoading = true
        errorMessage = nil
        
        do {
            // Fetch raw logs from service
            let diceLogs = try await service.fetchDiceLogs(for: group.urlPart)
            
            // Transform raw logs into players with rolls using Mapper
            let groupedPlayers = DiceLogMapper.groupRollsByPlayer(from: diceLogs)
            
            // Update published property to refresh UI
            players = groupedPlayers
            
        } catch {
            // Capture and publish any error encountered
            errorMessage = error.localizedDescription
        }
        
        // End loading state
        isLoading = false
    }
    
    // MARK: - TODOS
    /// - Load once a day or on a scroll down to refresh.
    ///
}
