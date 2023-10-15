//
//  PromptView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI

struct PromptView: View {
    @State var prompt1: String = "This is a longer prompt that will make users think more about what they really want to write about."
    @State var prompt2: String = "Prompt2"
    @State var prompt3: String = "What happens if prompts get way too long and they start to go off the screne because the AI generated an essay instead of a sentence. This is a longer prompt that will make users think more about what they really want to write about."
    
    @EnvironmentObject var prompt: Prompt
    @Binding var selectedTab: Tab
    
    
    var body: some View {
        ZStack {
            
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                    Text("Need a prompt to get you started?")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(CustomColor.t1)
                        .padding(.bottom)
        
                    VStack(spacing: 25) {
                        Button {
                            prompt.value = prompt1
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = .book
                            }
                        } label: {
                            PromptCard(prompt: prompt1, color: Color(red: 0.8745098039215686, green: 0.8156862745098039, blue: 0.7764705882352941))
                        }

                        Button {
                            prompt.value = prompt2
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = .book
                            }
                        } label: {
                            PromptCard(prompt: prompt2, color: Color(red: 0.7568627450980392, green: 0.7058823529411765, blue: 0.6745098039215687))
                        }

                        Button {
                            prompt.value = prompt3
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = .book
                            }
                        } label: {
                            PromptCard(prompt: prompt3, color: CustomColor.t2)
                        }

                        Spacer()
                    }
                }
                .padding()
            }

        }
    }

#Preview {
    PromptView(selectedTab: .constant(.pencil))
        .environmentObject(Prompt())
}
