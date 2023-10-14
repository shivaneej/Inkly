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
    @State var prompt1 = "Prompt 1"
    @State var prompt2 = "Prompt 2"
    @State var prompt3 = "Prompt 3"
    
    
    var body: some View {
        VStack {
            
            ZStack {
                Color(CustomColor.bg)
                    .ignoresSafeArea()
                
                VStack {
                    Text(prompt1)
                        .padding()
                        .background(CustomColor.t2)
                        .cornerRadius(12)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(CustomColor.t1)
                    
                    Text(prompt2)
                        .padding()
                        .background(CustomColor.t2)
                        .cornerRadius(12)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.t1)
                    
                    Text(prompt3)
                        .padding()
                        .background(CustomColor.t2)
                        .cornerRadius(12)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(CustomColor.t1)
                        
                        
                                    
                }
            }
            
        }
        
    }
}

#Preview {
    PromptView()
}


//.padding()
