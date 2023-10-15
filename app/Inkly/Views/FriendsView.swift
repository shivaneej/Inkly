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
                        BottomSheetView()
                            .presentationDetents([.medium, .large])
                    }
                }
            }
                .onAppear {
                    fetchUsernames()
                
            }
        }
    }
    
    struct BottomSheetView: View{
        var body: some View{
            Text("Some Stickers")
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





