//
//  GoogleSignUpView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/13/23.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

struct GoogleSignUpView: View {
//    @StateObject private var vm = AuthViewModel()
    @ObservedObject var vm: AuthViewModel

    
    var body: some View {
        NavigationView {
            ZStack {
                Color("journalBeige").ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("BackgroundImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 275)
                        Spacer()
                    }
                    
                    
                    Spacer()
                    VStack {
                        Text("Get started with Inkly")
                            .font(.title.bold())
                            .foregroundColor(Color("journalBrown"))
                            .padding([.leading, .trailing])
                            .padding([.leading, .trailing])
                        
                        HStack {
                            Spacer()
                            Spacer()
                            Button {
                                vm.signInWithGoogle()
                            } label: {
                            Text("Sign In With Google")
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("journalBrown"))
                                    .cornerRadius(10)
                                    .overlay(
                                        HStack {
                                            Spacer()
//                                            Image(systemName: "g.circle")
                                            Image("google")
                                                .resizable()
                                                .scaledToFit()
                                                .font(.title2)
                                                .padding()
                                                .foregroundColor(.white)
                                                .padding(.trailing, 53)
                                        }
                                    )
                            }
                            .padding(.vertical)
                            Spacer()
                            Spacer()
                        }
                    }
                    Spacer()
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
