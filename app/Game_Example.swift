//
//  ContentView.swift
//  War Card Game
//
//  Created by Alex Florea on 10/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card12"
    @State var playerScore = 0
    @State var cpuCard = "card7"
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func deal() {
        // Randomize the players card
        var playerCardValue:Int = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // Randomize the cpus card
        var cpuCardValue:Int = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // Update score
        if playerCardValue > cpuCardValue {
            playerScore += 1
        }
        
        else if playerCardValue < cpuCardValue {
            cpuScore += 1
        }
        
    }
}

#Preview {
    ContentView()
}
