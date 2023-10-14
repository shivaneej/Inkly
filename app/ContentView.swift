//
//  ContentView.swift
//  HackGT
//
//  Created by Alex Florea on 10/13/23.
//

import SwiftUI

let journalBeige = Color(red: 224/255.0, green: 201/255.0, blue: 166/255.0)

let journalBrown = Color(red: 64/255.0, green: 56/255.0, blue: 49/255.0)

struct ContentView: View {

    var body: some View {
        
        ZStack {
            Color(journalBeige)
                .ignoresSafeArea()
            
            VStack {
                Text("Past Journal Entries")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 20.0) {
                    HStack {
                        Text(Date.now, format: .dateTime.month(.wide).day().year())
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "pencil")
                            Image(systemName: "calendar")
                            Image(systemName: "theatermask.and.paintbrush.fill")
                        }
                    }
                    .font(.title2)
                    
                    Text("Stream of Consciousness")
                }
                .foregroundColor(journalBeige)

                .padding()
                .background(Rectangle()
                    .foregroundColor(journalBrown))
                    .cornerRadius(24)
                    .shadow(radius: 15)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
