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
    let color: Color
    
    var body: some View {
        Text(prompt)
            .font(.title3)
            .frame(maxWidth: .infinity)
            .padding()
            .background(color)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(CustomColor.t1, lineWidth: 2)
            )
            .foregroundColor(CustomColor.t1)
            .shadow(radius: 10)
    }
    
}

#Preview {
    PromptCard(prompt: "Hello", color: .blue)
}
