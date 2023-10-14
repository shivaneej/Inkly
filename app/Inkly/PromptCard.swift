//
//  PromptCard.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI
import Foundation

struct PromptCard: View {
    let prompt: String
    
    var body: some View {
        Text(prompt)
            .font(.title2)
            .frame(maxWidth: .infinity)
            .padding()
            .background(CustomColor.t2)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(CustomColor.t1, lineWidth: 3)
            )
            .foregroundColor(CustomColor.t1)
    }
    
}

#Preview {
    PromptCard(prompt: "Hello")
}
