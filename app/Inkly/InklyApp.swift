//
//  InklyApp.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/13/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct InklyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var authViewModel = AuthViewModel()

//    var body: some Scene {
//        WindowGroup {
////            ContentView()
//            GoogleSignUpView()
//        }
//    }
    
    var body: some Scene {
            WindowGroup {
                NavigationView {
                    if authViewModel.isSignedIn {
                        ContentView().environmentObject(authViewModel)
//                            .navigationBarItems(trailing: Button(action: {
//                                authViewModel.signOut()
//                            }) {
//                                Text("Sign Out")
//                            })
                    } else {
//                        GoogleSignUpView()
                        GoogleSignUpView(vm: authViewModel)

                    }
                }
            }
        }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
