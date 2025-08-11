//
//  GroupsView.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 07/08/2025.
//

import SwiftUI

// MARK: - Main view listing all groups -
struct GroupsView: View {
    
    // MARK:  StateObject
    /// Manages the list of groups
    @StateObject var groupsViewModel = GroupsViewModel()
    
    /// Controls the presentation of the EditGroupView sheet
    @State private var isShowingEditGroupSheet = false
    
    /// The group selected to edit.
    @State private var groupToEdit: Group? = nil
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            VStack(spacing: 16) { // Vertical stack with 16 pts spacing
                // Main title of the view
                Text("Select a group")
                    .font(.title)
                
                List {
                    // Loop through all groups in the state
                    ForEach(groupsViewModel.groups) { group in
                        
                        // Each group is clickable
                        Button(action: {
                            // TODO: Send the `selectGroup` action with the group's ID or navigate to details
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(group.name)
                                        .font(.system(size: 25, weight: .bold))
                                        .lineLimit(1)
                                    Text(group.urlPart)
                                        .font(.system(size: 20))
                                        .lineLimit(1)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding()
                            .padding(.horizontal)
                            .padding(.vertical, 4) // Space between cell
                        }
                        .onLongPressGesture {
                            groupToEdit = group // Set group to edit on long press
                            isShowingEditGroupSheet = true
                        }
                    }
                    .onDelete { indexSet in
                        // Delete group(s) from the list
                        groupsViewModel.deleteGroup(at: indexSet)
                    }
                    .listRowSeparator(.hidden)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
                }
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            // Show the sheet for adding a group
                            isShowingEditGroupSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                // Sheet presentation for adding a new group
                .sheet(isPresented: $isShowingEditGroupSheet) {
                    EditGroupView(
                        viewModel: EditGroupViewModel(
                            group: nil, // nil = adding new group
                            groupsViewModel: groupsViewModel
                        )
                    )
                }
            }
            
            
        }
    }
}

#Preview {
    GroupsView()
}
