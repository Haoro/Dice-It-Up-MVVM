//
//  EditGroupViewModel.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 08/08/2025.
//

import Foundation
import SwiftUI

// MARK: - ViewModel for EditGroupView -
// Handles the logic of creating or updating a group
class EditGroupViewModel: ObservableObject {
    
    // MARK: Private properties
    // Reference to the GroupsViewModel so we can update the list
    private var groupsViewModel: GroupsViewModel
    
    // Original group being edited (nil if creating a new group)
    private var originalGroup: Group?
    @State var title: String
    
    // MARK: Published properties (bindable from the View)
    @Published var inputName: String = ""
    @Published var inputUrlPart: String = ""
    
    // MARK: - Init
    // group is optional: nil means we are adding a new group
    // groupsViewModel is required so we can add/update the group in the list
    init(group: Group? = nil, groupsViewModel: GroupsViewModel) {
        self.originalGroup = group
        self.groupsViewModel = groupsViewModel
        
        // If editing an existing group, prefill the text fields
        if let group = group {
            title = "Edit Group"
            inputName = group.name
            inputUrlPart = group.urlPart
        } else {
            title = "Add Group"
        }
    }
    
    // MARK: - Public methods
    func saveGroup() {
        if var group = originalGroup {
            // Update existing group
            group.name = inputName
            group.urlPart = inputUrlPart
            groupsViewModel.updateGroup(group)
        } else {
            // Add new group
            let newGroup = Group(id: UUID(), name: inputName, urlPart: inputUrlPart)
            groupsViewModel.addGroup(newGroup)
        }
    }
}
