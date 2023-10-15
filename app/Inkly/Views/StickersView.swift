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
                Sticker(name: stickerNames[position], index: position)
            }
        }
        .padding(10)
    }
}


struct Sticker: View {
    
  @State private var dragAmount = CGSize.zero
  @State private var isDragging = false
    
  private let randomSize = CGFloat.random(in: 1...2) // Adjust the size range as needed
  private let randomRotation = Angle(degrees: Double.random(in: -45...45))
  private let randomX = CGFloat.random(in: -100...100) // Adjust the x-coordinate range as needed
  private let randomY = CGFloat.random(in: -100...100)
    
  var name: String
  var index: Int
    
  var body: some View {
    Image(name)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 100 * randomSize, height: 100 * randomSize)
      .rotationEffect(randomRotation)
      .offset(x: randomX, y: randomY)
      .scaleEffect(isDragging ? 1.1 : 1)
      .shadow(radius: isDragging ? 10 : 0)
      .offset(dragAmount)
      .zIndex(dragAmount == .zero ? 0 : 1)
      .gesture(
        DragGesture(coordinateSpace: .global)
          .onChanged {
            self.isDragging = true
            self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
          }
          .onEnded { _ in
            self.isDragging = false
          }
      )
     
  }
}
