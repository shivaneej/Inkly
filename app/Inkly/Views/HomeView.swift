//
//  HomeView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var prompt: Prompt

    @State private var mainText = ""
    @State private var isShowingAlert = false
    
    
    var body: some View {
        
        let uid = (authViewModel.user?.uid ?? "") as String
        let userName = (authViewModel.user?.displayName ?? "") as String
        let firstName = (userName != "" ? userName.split(separator: " ", maxSplits: 1)[0] : "User")
        
        ZStack {

            Color("background")
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                HStack {
                    Text("Hello, " + firstName)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(CustomColor.t1)

                    Spacer()
                    Button {
                        // Add action for "Done" button here
                        isShowingAlert = true
                        DataPost(mainText: mainText, prompt: prompt, uid: uid)
                    } label: {
                        ZStack {
                            Text("Done")
                                .foregroundColor(CustomColor.t1) // Text color
                                .font(.headline)

                            RoundedRectangle(cornerRadius: 10)
                                .stroke(CustomColor.t1, lineWidth: 2) // Border color and width
                                .frame(width: 70, height: 30) // Adjust the height as needed
                        }
                    }
                    .alert("Journal Entry Submitted!", isPresented: $isShowingAlert) {
                        Button("Okay") {} // KEEP THIS {} HERE
                    }
                    .padding(.trailing, 20)
                }
                .padding([.top, .leading, .trailing])

                Text(prompt.value)
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(CustomColor.t1)
                    .padding([.leading, .bottom, .trailing])

                HStack {
                    Text(Date.now, format: .dateTime.month(.wide).day().year())
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(CustomColor.t1)

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, -10)

                CustomTextEditor.init(placeholder:"Begin writing your entry here", text: $mainText)
                    .font(.subheadline)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(CustomColor.t1)
                    .padding(.top, -5)
                    .padding([.leading, .bottom, .trailing], 6)

            }
        }
    }
}





@MainActor func DataPost(mainText: String, prompt: Prompt, uid: String){
    let viewModel = WriteViewModel()
    viewModel.pushDataToDatabase(mainText, Date.now, uid, prompt.value, prompt.key)
}

struct CustomTextEditor: View{
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            if text.isEmpty{
                Text(placeholder)
//                    .foregroundColor (Color.primary.opacity(0.25))
                    .foregroundColor (CustomColor.t1.opacity(0.3))
                    .padding(EdgeInsets(top: 7, leading: 4, bottom: 0, trailing: 0))
                    .padding(internalPadding)
                }
                TextEditor (text: $text)
                    .padding (internalPadding)
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }
    }
}

//#Preview {
//    HomeView()
//        .environmentObject(AuthViewModel())
//        .environmentObject(Prompt())
//}
