//
//  ProfileView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI
import URLImage

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject
    var readViewModel = ReadViewModel()
    
    @State private var streakCount: Int = 0
    @State private var numEntries: Int = 0

    var body: some View {
        let user = authViewModel.user
        let name = user?.displayName
        let photoURL = user?.photoURL
        
        NavigationView {
            ZStack {
                Color("background")
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(height: 0.25 * UIScreen.main.bounds.height)
                            .foregroundColor(Color("journalBrown"))
                        URLImage(URL(string: photoURL?.absoluteString ?? "https://picsum.photos/id/237/200/300")!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color("journalBeige"), lineWidth: 4))
                                .shadow(radius: 7)
                                .padding(.top, 10)
                        }
                    }
                    
                    Text(name ?? "Not signed in")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .foregroundColor(Color("journalBrown"))
                    
                    // Streak Count and Num Entries
                    HStack {
                        VStack {
                            Text("🔥 Streak")
                                .fontWeight(.bold)
                                .foregroundColor(Color("journalBrown"))
                            Text("\(streakCount)")
                                .foregroundColor(Color("journalBrown"))
                        }
                        .padding()
                        
                        VStack {
                            Text("📝 Entries")
                                .fontWeight(.bold)
                                .foregroundColor(Color("journalBrown"))
                            Text("\(numEntries)")
                                .foregroundColor(Color("journalBrown"))
                        }
                        .padding()
                    }
                    VStack(spacing: 10) {
                        Spacer()
                        // Navigate to LogView
                        NavigationLink(destination: LogView()) {
                            Text("View Log")
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("journalBrown"), lineWidth: 2)
                                        .frame(width: 0.75 * UIScreen.main.bounds.width)
                                )
                                .foregroundColor(Color("journalBrown"))
                        }
                        
                        // Navigate to FriendView
                        NavigationLink(destination: FriendsView()) {
                            Text("View Friends")
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("journalBrown"), lineWidth: 2)
                                        .frame(width: 0.75 * UIScreen.main.bounds.width)
                                )
                                .foregroundColor(Color("journalBrown"))
                        }
                        Spacer()
                    }
                }
                .onAppear {
                            // Call the function when the view appears
                            fetchUserStats()
            }
        }

            
        }
        
    }
    
    func fetchUserStats() {
        if let userUid = authViewModel.user?.uid {
                    readViewModel.fetchUserStats(uid: userUid) { stats in
                        print("UID to be fetched is \(userUid)")
                        streakCount = stats?["streak"] as! Int
                        numEntries = stats?["numOfEntries"] as! Int
                        
                    }
                }
    }
}

#Preview {
    ProfileView()
}
