//
//  ContentView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/13/23.
//


import SwiftUI

struct CustomColor {
    static let bg = Color("Background")
    static let t1 = Color("TextPrimary")
    static let t2 = Color("TextSecondary")
}

@MainActor class Prompt: ObservableObject {
    @Published var value = "What's on your mind today..."
}


struct ContentView: View {
    @State private var selectedTab: Tab = .book
    @StateObject var currentPrompt = Prompt()
    
    // Get rid of default tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                switch selectedTab {
                case .person:
                    ProfileView()
                case .book:
                    HomeView(promptValue: $currentPrompt.value)
                case .pencil:
                    PromptView(selectedTab: $selectedTab)
                case .envelope:
                    LogView()
                }
            }
            .environmentObject(currentPrompt)
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        
    }
}

#Preview {
    ContentView()
}

