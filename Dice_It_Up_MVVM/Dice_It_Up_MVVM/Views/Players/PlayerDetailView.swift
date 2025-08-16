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
    
    // MARK: - Local UI State
    @State private var selectedSegment: Segment = .titles // Default selection for the Picker
    
    // MARK: - Enum for Picker segments
    enum Segment: String, CaseIterable, Identifiable {
        case titles = "Titles"
        case sessions = "Sessions"
        
        var id: String { rawValue }
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 16) { // Vertical stack with spacing
            
            // Main title - player's name
            Text(playerDetailViewModel.player.name)
                .font(.title)
            
            // Segmented Picker to switch between "Titles" and "Sessions"
            Picker("Select View", selection: $selectedSegment) {
                ForEach(Segment.allCases) { segment in
                    Text(segment.rawValue)
                        .tag(segment)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            // Scrollable content changes based on selected segment
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: Titles Section
                    if selectedSegment == .titles {
                        if playerDetailViewModel.player.earnedTitles.isEmpty {
                            // No titles placeholder
                            Text("No titles earned yet.")
                                .foregroundColor(.secondary)
                                .padding()
                        } else {
                            LazyVStack(spacing: 15) {
                                ForEach(playerDetailViewModel.player.earnedTitles) { title in
                                    TitleCell(title: title)
                                        .padding()
                                        .frame(maxWidth: .infinity) // expand to full width
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(Color.yellow)
                                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                        )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // MARK: Sessions Section
                    if selectedSegment == .sessions {
                        if playerDetailViewModel.player.sessions.isEmpty {
                            // No sessions placeholder
                            Text("No sessions recorded yet.")
                                .foregroundColor(.secondary)
                                .padding()
                        } else {
                            LazyVStack(spacing: 15) {
                                ForEach(playerDetailViewModel.player.sessions) { session in
                                    SessionCell2(session: session)
                                        .padding()
                                        .frame(maxWidth: .infinity) // expand to full width
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(Color(.systemGray5))
                                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                        )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.vertical, 10)
            .scrollContentBackground(.hidden) // Remove default background
        }
    }
}

struct SessionCell2: View {
    var session: Session
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .center, spacing: 6) {
                Text(session.date.formatted(date: .numeric, time: .omitted))
                    .font(.system(size: 22, design: .monospaced))
                // Both crit and fumble columns
                HStack {
                    Spacer()
                    // Critical - Left column
                    VStack {
                        Text("Critical")
                            .font(.title)
                            .foregroundStyle(.green)
                            .bold()
                        Spacer()
                        Text("1 : \(session.omegaCritCount)")
                            .font(.system(size: 30, design: .monospaced))
                            .bold()
                        Text("2-10 : \(session.critCount)")
                            .font(.system(size: 25, design: .monospaced))
                            .bold()
                    }
                    
                    // Séparation des Critical et Fumble
                    Spacer()
                    Divider()
                    Spacer()
                    
                    // Fumble - Right Column
                    VStack {
                        Text("Fumble")
                            .font(.title)
                            .foregroundStyle(.red)
                            .bold()
                        Spacer()
                        Text("100 : \(session.omegaFumbleCount)")
                            .font(.system(size: 30, design: .monospaced))
                            .bold()
                        Text("91-99 : \(session.fumbleCount)")
                            .font(.system(size: 25, design: .monospaced))
                            .bold()
                    }
                    Spacer()
                }
                Spacer()
                // Total rolls
                Text("Number of rolls : \(session.totalRolls)")
                    .font(.headline)
                    .italic()
                    .foregroundStyle(.primary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading) // Pin top content
    }
}

//#Preview {
//    TitleCell(title: .init(name: "Test Title", rollValues: [1, 2, 3], description: "This is a test title."))
//}

#Preview {
    PlayerDetailView(
        playerDetailViewModel: PlayerDetailViewModel(
            player: Player(
                name: "Patrick",
                rolls: [
                    DiceRoll(input: "1d20", result: 20, comment: "Attack", timestamp: Int(Date().timeIntervalSince1970)),
                    DiceRoll(input: "1d20", result: 1, comment: "Defense", timestamp: Int(Date().timeIntervalSince1970)),
                    DiceRoll(input: "1d20", result: 15, comment: nil, timestamp: Int(Date().addingTimeInterval(-86400).timeIntervalSince1970))
                ],
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
