//
//  CustomTabBar.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case person
    case book
    case pencil
    case paintpalette
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        switch selectedTab {
        case .person:
            selectedTab.rawValue + ".fill"
        case .pencil:
            selectedTab.rawValue
        case .paintpalette:
            selectedTab.rawValue + ".fill"
        case .book:
            selectedTab.rawValue + ".fill"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? CustomColor.t2 : CustomColor.bg)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
                
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(CustomColor.bg)
        .padding()
        .background(Rectangle())
        .foregroundColor(CustomColor.t1)
        .cornerRadius(24)
        .shadow(radius: 15)
        .padding()
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.book))
}
