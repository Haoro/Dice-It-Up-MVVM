//
//  GroupsViewModel.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 07/08/2025.
//

import Foundation

class GroupsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    // Group list displayed on the view.
    @Published var groups: [Group] = []
    
    /// The group we want to see the details .
    @Published var selectedGroup: Group? = nil // Navigation trigger
    
    // MARK: - Init
    /// Init ViewModel (local or mock loading)
    init() {
        loadMockGroups()
    }
    
    // MARK: - Public Methods
    /// Load mock groups (depuis une source locale ou persistée)
    func loadMockGroups() {
        groups = [
            Group(name: "Groupe 1", urlPart: "ayana_groupe_1"),
            Group(name: "Groupe 2", urlPart: "ayana_groupe_2"),
        ]
    }
    /// Add a new group.
    func addGroup(_ newGroup: Group) {
        // TODO: Needs verification regarding the created group name/url.
        groups.append(newGroup)
    }
    /// Update a group at the given index.
    func updateGroup(_ group: Group) {
        if let index = groups.firstIndex(where: { $0.id == group.id }) {
            groups[index] = group
        }
    }
    /// Delete a group at the given index.
    func deleteGroup(at index: IndexSet) {
        groups.remove(atOffsets: index)
    }
    
    // MARK: - Private Helpers
    // Private method to order or validate groups
}
