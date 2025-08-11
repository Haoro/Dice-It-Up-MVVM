//
//  Title.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

import Foundation

/// Les titres sont des bonus donnés aux joueurs en fonction des jets de dés qu’ils font.
/// Chaque titre concerne un ou plusieurs résultats de dés possibles et ne peut-être attribué qu’à un seul player à chaque début de session.
struct Title: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let rollValues: [Int]
    let description: String
}

extension Title {
    static let numberOne = Title(
        name: "Number One",
        rollValues: [1],
        description: "Peut remplacer le jet d’un autre joueur ou pnj avec un 1."
    )
    static let jackpotMaster = Title(
        name: "Jackpot Master",
        rollValues: [7],
        description: "Trouve un objet random dans les environs."
    )
    static let captainUnlucky = Title(
        name: "Captain Unlucky",
        rollValues: [13],
        description: "Donne un désavantage à un PJ ou PNJ."
    )
    static let tarotProphet = Title(
        name: "Tarot Prophet",
        rollValues: [21],
        description: "Tire une carte de Tarot pour prédir l’avenir."
    )
    static let expeditionLeader = Title(
        name: "Expedition Leader",
        rollValues: [33],
        description: "Donnes un avantage à deux joueurs ou plus qui souhaitent faire une action combinée."
    )
    static let universeEngineer = Title(
        name: "Universe Engineer",
        rollValues: [42],
        description: "Peux déduire une information sur la nature du monde d’Ayana ou de ses habitants."
    )
    static let middleMan = Title(
        name: "Middle Man",
        rollValues: [50],
        description: "Peut décider que le prochain lancer (PJ ou PNJ) soit 50-50 pour réussite ou échec critique."
    )
    static let devilDealer = Title(
        name: "Devil Dealer",
        rollValues: [66],
        description: "Peut trouver/se faire approcher par des gens peu scrupuleux/douteux qui proposent aux joueurs des missions… “spéciales”."
    )
    static let seductionEmperor = Title(
        name: "Seduction Emperor",
        rollValues: [69],
        description: "Bonus de charisme en parlant aux pnj, et peut trouver un pnj plus facilement pour aider le groupe (selon la situation)."
    )
    static let atlansFollower = Title(
        name: "Atlans Follower",
        rollValues: [92],
        description: "Protège d’un coup via une miche de bain bénie caché sous les vêtements."
    )
    static let lifeCoach = Title(
        name: "Life Coach",
        rollValues: [100],
        description: "Sur un échec critique, le joueur peut décider de l’annuler en débloquant un nouveau move du perso concerné (donc principalement en combat, mais pas forcément, ça dépend des situations)."
    )
    static let tenseChampion = Title(
        name: "Tense Champion",
        rollValues: [19,28,37,46,55,64,73,82,91],
        description: "Lors d’un critique, le joueur peut décider de le renforcer pour amplifier l’effet du critique."
    )
    static let dualWielder = Title(
        name: "Dual Wielder",
        rollValues: [11,22,33,44,55,66,77,88,99],
        description: "Permet de coordonner deux personnages pour réussir automatiquement deux actions faites simultanément (de façon normal, donc moins d’efficacité que si fait “normalement” et avec un succès critique)."
    )

    static let all: [Title] = [
        .numberOne, .jackpotMaster, .captainUnlucky, .tarotProphet,
        .expeditionLeader, .universeEngineer, .middleMan, .devilDealer,
        .seductionEmperor, .atlansFollower, .lifeCoach, .tenseChampion,
        .dualWielder
    ]
}
