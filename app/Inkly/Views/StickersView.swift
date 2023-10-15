//
//  StickersView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/15/23.
//

import SwiftUI

struct StickersView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject
    var readViewModel = ReadViewModel()
    
    @State private var stickerNames: [String] = []
    
    var body: some View {
        ZStack {
            Color("background")
            VStack {
                StickerGridView(stickerNames: stickerNames)
            }
        }
        .onAppear {
            fetchUserStickers()
        }
            
    }
    
    func fetchUserStickers() {
        if let userUid = authViewModel.user?.uid {
            readViewModel.fetchUserStickers(uid: userUid) { stickers in
                stickerNames = stickers ?? []
            }
        }
    }
}


struct StickerGridView: View {
    let stickerNames: [String]

    var body: some View {
        let shuffledPositions = Array(0..<stickerNames.count).shuffled()

        VStack {
            ForEach(shuffledPositions, id: \.self) { position in
                let randomSize = CGFloat.random(in: 1...2) // Adjust the size range as needed
                let randomRotation = Angle(degrees: Double.random(in: -45...45))
                let randomX = CGFloat.random(in: -100...100) // Adjust the x-coordinate range as needed
                let randomY = CGFloat.random(in: -100...100)
                Image(stickerNames[position])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100 * randomSize, height: 100 * randomSize)
                    .rotationEffect(randomRotation)
                    .offset(x: randomX, y: randomY)
            }
        }
        .padding(10)
    }
}
