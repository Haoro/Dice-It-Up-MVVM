//
//  PlayerDetailViewModel.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

/// ViewModel responsible for viewing a player's titles and dice rolls.
@MainActor
class PlayerDetailViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var player: Player
    
    // MARK: - Init
    init(player: Player) {
        self.player = player
    }
    
    // MARK: - Public Methods
    
}
