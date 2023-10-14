//
//  PromptView.swift
//  HackGT
//
//  Created by Alex Florea on 10/14/23.
//

import SwiftUI

struct Prompt {
    let prompt: String
}

struct PromptView: View {
    @State var prompt1: String = "This is a longer prompt that will make users think more about what they really want to write about."
    @State var prompt2: String = "Prompt2"
    @State var prompt3: String = "What happens if prompts get way too long and they start to go off the screne because the AI generated an essay instead of a sentence. This is a longer prompt that will make users think more about what they really want to write about."
    
    
    var body: some View {
        ZStack {
            
            Color(CustomColor.bg)
                .ignoresSafeArea()
            
            VStack {
                Text("Need a prompt to get you started?")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(CustomColor.t1)
                
                ScrollView {
                    VStack(spacing: 20) {
                        PromptCard(prompt: prompt1)
                        PromptCard(prompt: prompt2)
                        PromptCard(prompt: prompt3)
                        Spacer()
                    }
                    .padding()
                }
            }
            
            
        }
    }
}

#Preview {
    PromptView()
}
