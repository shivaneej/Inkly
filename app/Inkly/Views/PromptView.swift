//
//  PromptView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI

struct Prompt {
    let prompt: String
}

struct ServerResponse: Decodable {
    let llmdata: String
}

struct PromptView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = ReadViewModel()
    
    @State var prompt1: String = "What's on your mind right now?"
    @State var prompt2: String = "Loading..." // got from the ai
    
    static let promptOptions: [String] = [
        "What's a lesson you learned today that you didn't know yesterday?",
        "What is one thing you are grateful for today?",
        "Describe a moment today that you would want to remember five years from now.",
        "If you could change one thing about today, what would it be?",
        "Who made a positive impact on your day and why?"
    ]
    @State var prompt3: String = promptOptions.randomElement() ?? "What made you smile today?"

    func fetchData() {
        guard let uid = authViewModel.user?.uid else { return }
        viewModel.fetchLatestEntry(for: uid) { combinedAnswer in
            guard let answer = combinedAnswer else {
                print("Failed to get latest entry.")
                return
            }
            
            print("printing json answer got")
            print(answer)
            
            let jsonData: [String: Any] = ["key": answer]
            guard let url = URL(string: "https://llming-395a5afa1bb5.herokuapp.com/process") else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: jsonData, options: [])
            
            print(request)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error sending request: \(error)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Response Status code: \(httpResponse.statusCode)")
                }
                
                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(ServerResponse.self, from: data)
                        DispatchQueue.main.async {
                            print(decodedResponse.llmdata)
                            prompt2 = decodedResponse.llmdata
                        }
                    } catch {
                        print("Failed to decode server response: \(error)")
                    }
                }
            }.resume()

        }

    }
    
    var body: some View {
        ZStack {
            
//            Color(CustomColor.bg)
            Color("journalBeige")
                .ignoresSafeArea()
            
            VStack {
                Text("Need a prompt to get you started?")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(CustomColor.t1)
                
                ScrollView {
                    VStack(spacing: 20) {
                        PromptCard(prompt: prompt1)
                        PromptCard(prompt: prompt2)
                        PromptCard(prompt: prompt3)
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            fetchData()
            
        }
    }
}

#Preview {
    PromptView()
}
