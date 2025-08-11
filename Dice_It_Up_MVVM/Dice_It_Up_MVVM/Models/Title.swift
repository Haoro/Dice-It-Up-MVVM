//
//  Title.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 11/08/2025.
//

/// Les titres sont des bonus donnés aux joueurs en fonction des jets de dés qu’ils font.
/// Chaque titre concerne un ou plusieurs résultats de dés possibles et ne peut-être attribué qu’à un seul player à chaque début de session.
enum Title {
    /// Roll : 1
    /// Peut remplacer le jet d’un autre joueur ou pnj avec un 1.
    case numberOne
    /// Roll : 7
    /// Trouve un objet random dans les environs.
    case jackpotMaster
    /// Roll : 13
    /// Donne un désavantage à un PJ ou PNJ.
    case captainUnlucky
    /// Roll : 21
    /// Tire une carte de Tarot pour prédir l’avenir.
    case tarotProphet
    /// Roll : 33
    /// Donnes un avantage à deux joueurs ou plus qui souhaitent faire une action combinée.
    case expeditionLeader
    /// Roll : 42
    /// Peux déduire une information sur la nature du monde d’Ayana ou de ses habitants.
    case universeEngineer
    /// Roll : 50
    /// Peut décider que le prochain lancer (PJ ou PNJ) soit 50-50 pour réussite ou échec critique.
    case middleMan
    /// Roll : 66
    /// Peut trouver/se faire approcher par des gens peu scrupuleux/douteux qui proposent aux joueurs des missions… “spéciales”.
    case devilDealer
    /// Roll : 69
    /// Bonus de charisme en parlant aux pnj, et peut trouver un pnj plus facilement pour aider le groupe (selon la situation).
    case seductionEmperor
    /// Roll : 92
    /// Protège d’un coup via une miche de bain bénie caché sous les vêtements.
    case atlansFollower
    /// Roll : 100
    /// Sur un échec critique, le joueur peut décider de l’annuler en débloquant un nouveau move du perso concerné (donc principalement en combat, mais pas forcément, ça dépend des situations).
    case lifeCoach
    /// Roll : 19-28-37-46-55-64-73-82-91
    /// Lors d’un critique, le joueur peut décider de le renforcer pour amplifier l’effet du critique.
    case tenseChampion
    /// Roll : 11-22-33-44-55-66-77-88-99
    /// Permet de coordonner deux personnages pour réussir automatiquement deux actions faites simultanément (de façon normal, donc moins d’efficacité que si fait “normalement” et avec un succès critique).
    case dualWielder
}
