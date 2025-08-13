//
//  PlayerDetailView.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import SwiftUI

struct PlayerDetailView: View {
    
    // MARK: - StateObject
    @StateObject var playerDetailViewModel: PlayerDetailViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 16) { // Vertical stack with 16 pts spacing
            // Main title of the view
            Text(playerDetailViewModel.player.name)
                .font(.title)
            
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(playerDetailViewModel.player.earnedTitles) { title in
                        // Each title is now handled by its own expandable row
                        TitleRow(title: title)
                            .padding()
                            .frame(maxWidth: .infinity) // expand to full width
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.yellow)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            )
                    }
                }
            }
            .padding(10)
            .scrollContentBackground(.hidden) // Remove default background
            .listStyle(.insetGrouped) // Compact list style
        }
    }
}

struct TitleRow: View {
    var title: Title
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Always-visible header
            VStack(alignment: .leading, spacing: 6) {
                Text(title.name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("Rolls: \(title.rollValues.map(String.init).joined(separator: ", "))")
                    .font(.callout)
                    .italic()
                    .foregroundStyle(.primary)
            }
            
            // Expanding content
            if isExpanded {
                Text(title.description)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.top, 4)
            }
            
            // Arrow button at the bottom center
            HStack {
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isExpanded.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0)) // Rotate 180° when expanded
                        .animation(.easeInOut(duration: 0.25), value: isExpanded)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading) // Pin top content
        .animation(.easeInOut(duration: 0.25), value: isExpanded)
    }
}

//#Preview {
//    TitleRow(title: .init(name: "Test Title", rollValues: [1, 2, 3], description: "This is a test title."))
//}

#Preview {
    PlayerDetailView(
        playerDetailViewModel: PlayerDetailViewModel(
            player: Player(
                id: UUID(),
                name: "Patrick",
                rolls: [],
                rollsCount: [:],
                earnedTitles: [
                    Title(
                        name: "Life Coach",
                        rollValues: [100],
                        description: "Sur un échec critique, le joueur peut décider de l’annuler en débloquant un nouveau move du perso concerné (donc principalement en combat, mais pas forcément, ça dépend des situations)."
                    ),
                    Title(
                        name: "Tense Champion",
                        rollValues: [19,28,37,46,55,64,73,82,91],
                        description: "Lors d’un critique, le joueur peut décider de le renforcer pour amplifier l’effet du critique."
                    ),
                    Title(
                        name: "Dual Wielder",
                        rollValues: [11,22,33,44,55,66,77,88,99],
                        description: "Permet de coordonner deux personnages pour réussir automatiquement deux actions faites simultanément (de façon normal, donc moins d’efficacité que si fait “normalement” et avec un succès critique)."
                    )
                ]
            )
        )
    )
}
