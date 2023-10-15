//
//  LogView.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/14/23.
//

import SwiftUI

struct LogView: View {
    @ObservedObject var viewModel = ReadViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        List {
            ForEach(viewModel.dateEntries) { dateEntry in
                Section(header: Text(dateEntry.id)) {  // Using date as section header
                    ForEach(dateEntry.prompts) { prompt in
                        DisclosureGroup(prompt.question) {
                            Text(prompt.answer)
                        }
                    }
                }
            }
        }
        .onAppear {
            if let uid = authViewModel.user?.uid {
                viewModel.readDataFromDatabase(uid: uid) { }
            }
        }
    }
}

#Preview {
    LogView()
}
