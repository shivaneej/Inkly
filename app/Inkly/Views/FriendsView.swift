//
//  FriendsView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//
import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseAuth

struct FriendsView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State var showingBottomSheet = false
    @State private var usernames: [String] = [] // Define an array to hold usernames
    @State private var isLoading = true // Flag to show loading indicator

    var body: some View {
        NavigationView {
            List(usernames, id: \.self) { username in
                HStack{
                    Text(username)
                    Spacer()
                        Button(action: {
                            showingBottomSheet.toggle()
                        }) {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(Color("journalBrown"))
                                .background(Color("background"))
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    
                    .padding()
                    .sheet(isPresented: $showingBottomSheet) {
                        // Add the content of your bottom sheet here
                        BottomSheetView(uid: authViewModel.user?.uid ?? "", targetUsername: username, showingBottomSheet: $showingBottomSheet)
                            .presentationDetents([.medium, .large])
                    }
                }
            }
                .onAppear {
                    fetchUsernames()
                
            }
        }
    }
    
    struct BottomSheetView: View {
        @Binding var showingBottomSheet: Bool
        var uid: String
        var targetUsername: String
        let stickersRef: DatabaseReference
        @State private var stickers: [String] = [] // Array to hold sticker names

        init(uid: String, targetUsername: String, showingBottomSheet: Binding<Bool>) {
            self._showingBottomSheet = showingBottomSheet
            self.uid = uid
            self.targetUsername = targetUsername // <-- Initialize new property
            self.stickersRef = Database.database().reference().child("users").child(uid).child("stickers")
        }

        var body: some View {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 10),
                            GridItem(.flexible(), spacing: 10),
                            GridItem(.flexible(), spacing: 10),
                        ], spacing: 10)  {
                        ForEach(stickers, id: \.self) { stickerName in
                            Image(stickerName) // Use the sticker name to load the image from your assets
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .onTapGesture {
                                    sendSticker(stickerName: stickerName)
                                }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                fetchStickers()
            }
        }

        func sendSticker(stickerName: String) {
            self.showingBottomSheet = false
            let allUsersRef = Database.database().reference().child("users")

            allUsersRef.observeSingleEvent(of: .value) { snapshot in
                if let userDict = snapshot.value as? [String: Any] {
                    for (userID, _) in userDict {
                        let userStickersRef = Database.database().reference().child("users").child(userID).child("stickers")
                        
                        userStickersRef.observeSingleEvent(of: .value) { stickerSnapshot in
                            if let stickersData = stickerSnapshot.value as? [String] {
                                let newIndex = stickersData.count // Next index based on current array size
                                userStickersRef.child("\(newIndex)").setValue(stickerName)
                            } else {
                                // If no stickers exist yet, start at index 0
                                userStickersRef.child("0").setValue(stickerName)
                            }
                        }
                    }
                }
            }
        }
        
        func fetchStickers() {
            stickersRef.observe(.value) { snapshot in
                if let stickersData = snapshot.value as? [String] {
                    self.stickers = stickersData
                }
            }
        }

    }


    func fetchUsernames() {
        
        let name = authViewModel.user?.displayName
        
        let ref = Database.database().reference().child("users")
        
        ref.observe(.value) { snapshot in
            if let userDict = snapshot.value as? [String: Any] {
                var tempUsernames: [String] = []
                for (_, userData) in userDict {
                    if let userDataDict = userData as? [String: Any],
                       let userInfo = userDataDict["userInfo"] as? [String: Any],
                       let username = userInfo["username"] as? String {
                        if username != name{
                            tempUsernames.append(username)
                        }
                        
                    }
                }
                self.usernames = tempUsernames
                self.isLoading = false
            } else {
                // Handle the case where no users are found
                self.isLoading = false
            }
        }
    }
}





