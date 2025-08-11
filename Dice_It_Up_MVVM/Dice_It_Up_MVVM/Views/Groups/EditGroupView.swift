//
//  EditGroupView.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 08/08/2025.
//

import SwiftUI

import SwiftUI

// MARK: - View for adding or editing a group -
struct EditGroupView: View {
    // MARK: StateObject
    // We use a StateObject so that the ViewModel's lifecycle is tied to the view
    @StateObject var viewModel: EditGroupViewModel
    
    // MARK: Environment
    // This is used to dismiss the sheet when the user taps "Done"
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Group Information")) {
                        LabeledContent("Name") {
                            TextField("Group Name", text: $viewModel.inputName)
                        }
                        LabeledContent("Room URL") {
                            TextField("Room URL", text: $viewModel.inputUrlPart)
                        }
                    }
            }
            .navigationTitle($viewModel.title) // Title shown in navigation bar
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        // Ask the ViewModel to save the data
                        viewModel.saveGroup()
                        // Dismiss the sheet
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    EditGroupView(
        viewModel: EditGroupViewModel(
            group: Group(name: "Preview Group", urlPart: "preview"),
            groupsViewModel: GroupsViewModel()
        )
    )
}
