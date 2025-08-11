//
//  PlayersView.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import SwiftUI

struct PlayersView: View {
    
    // MARK: - StateObject
    @StateObject var playerViewModel: PlayersViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 16) { // Vertical stack with 16 pts spacing
            // Main title of the view
            Text(playerViewModel.group.name)
                .font(.title)
            
            List {
                ForEach(playerViewModel.players) { player in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(player.name)
                                .font(.system(size: 25, weight: .bold))
                                .lineLimit(1)
                        }
                        Spacer()
                    }
                    .padding()
                    .padding(.horizontal)
                    .padding(.vertical, 4) // Space between cells
                    .contentShape(Rectangle()) // Rend toute la cellule cliquable
                    .onTapGesture {
                        // Action principale : ouvrir détails
                        print("Tap on \(player.name)")
                        // TODO: Navigate to see the player's details.
                    }
                }
                .listRowSeparator(.hidden)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
            }
            .scrollContentBackground(.hidden)
        }
        .task {
            await playerViewModel.fetchData()
        }
    }
}

#Preview {
    PlayersView(playerViewModel:
                    PlayersViewModel(group:
                                        Group(name: "Groupe 1",
                                              urlPart: "ayana_groupe_1")
                                    )
    )
}
