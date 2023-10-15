//
//  HomeView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var prompt: Prompt
    @Binding var promptValue: String
    
    var body: some View {
        ZStack {
            Color("Background")
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
                TextEditor(text: $prompt.value)
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
    HomeView(promptValue: .constant("Test"))
        .environmentObject(Prompt())
}
