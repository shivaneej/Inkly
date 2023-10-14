//
//  ContentView.swift
//  HackGT
//
//  Created by Alex Florea on 10/13/23.
//

import SwiftUI

struct CustomColor {
    static let bg = Color("Background")
    static let t1 = Color("TextPrimary")
    static let t2 = Color("TextSecondary")
}

struct ContentView: View {
    @State private var selectedTab: Tab = .book
    
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
                    HomeView()
                case .pencil:
                    PromptView()
                case .envelope:
                    LogView()
                }
            }
            
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
