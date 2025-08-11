//
//  Group.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 07/08/2025.
//

import Foundation

// A group represents one group of player the dm is playing with.
struct Group : Identifiable, Hashable {
    // Unique id used to avoid confusion while handling lists.
    let id : UUID = UUID()
    // The group's name.
    var name : String
    // The group url's last part
    // used with : https://rolz.org/api/roomlog?room=
    var urlPart : String
}
