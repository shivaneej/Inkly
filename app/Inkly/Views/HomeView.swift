//
//  HomeView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var mainText = ""
//    @State private var prompt = "What's on your mind today"
    @State private var promptKey = "prompt1"
    
    
    @EnvironmentObject var prompt: Prompt
    @Binding var promptValue: String // TODO: Check if this can be deleted
    
    var body: some View {
        
        let uid = (authViewModel.user?.uid ?? "") as String
        
        ZStack {
//            Color(CustomColor.bg)
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                HStack{
                    Spacer()
                    Text(prompt.value)
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(CustomColor.t1)
                        .padding(.top, 20.0)
                    
                    Spacer() // Add pace to push the "Done" button to the right
                    Button(action: {
                        // Add action for "Done" button here
                        DataPost(mainText: mainText, prompt: prompt.value, promptKey: promptKey, uid: uid)
                    }) {
                        ZStack {
                                Text("Done")
                                    .foregroundColor(CustomColor.t1) // Text color
                                    .font(.headline)
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(CustomColor.t1, lineWidth: 2) // Border color and width
                                    .frame(width: 70, height: 30) // Adjust the height as needed
                            }.padding(.trailing, 10)
                    }
                        
                }
                
                Text(Date.now, format: .dateTime.month(.wide).day().year())
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(CustomColor.t1)
                    .font(.subheadline)
                
                // TODO replace text with what was allready written if user leaves app
                CustomTextEditor.init(placeholder:"Enter here", text: $mainText)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(CustomColor.t2)
                    .padding([.leading, .bottom, .trailing])
                                
            }
        }
    }
}

func SubmitEntry(entry: String) {
    // TODO submit entry to log when day changes (so at midnight?)
}

func DataPost(mainText: String, prompt: String, promptKey: String, uid: String){
    let viewModel = WriteViewModel()
//    let uid = "TqbRkGwH6eQ7kqq85WV1Hemm7bQ4"
    
    viewModel.pushDataToDatabase(mainText, Date.now, uid, prompt, promptKey)
}

struct CustomTextEditor: View{
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            if text.isEmpty{
                Text(placeholder)
                    .foregroundColor (Color.primary.opacity(0.25))
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
//}
