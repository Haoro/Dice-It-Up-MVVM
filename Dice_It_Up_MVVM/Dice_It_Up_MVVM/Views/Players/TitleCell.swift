//
//  TitleCell.swift
//  Dice_It_Up_MVVM
//
//  Created by The Real Itto on 14/08/2025.
//

import SwiftUI

struct TitleCell: View {
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
