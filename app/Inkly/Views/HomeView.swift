//
//  HomeView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI

struct HomeView: View {
    @State private var mainText = "What's on your mind today..."
    
    var body: some View {
        ZStack {
//            Color(CustomColor.bg)
            Color("journalBeige")
                .ignoresSafeArea()
            
            VStack {
                Text("Hello, Alex")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(CustomColor.t1)
                    .padding(.top, 20.0)
                
                Text(Date.now, format: .dateTime.month(.wide).day().year())
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(CustomColor.t1)
                    .font(.title2)
                
                // TODO replace text with what was allready written if user leaves app
                TextEditor(text: $mainText)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(CustomColor.t2)
                    .padding([.leading, .bottom, .trailing])
                                
            }
        }
    }
}

func SubmitEntry(entry: String) {
    // TODO submit entry to log when day changes (so at midnight?)
}

#Preview {
    HomeView()
}
