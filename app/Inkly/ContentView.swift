//
//  ContentView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/13/23.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



import SwiftUI

struct CustomColor {
    static let bg = Color("journalBeige")
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

