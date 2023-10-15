//
//  SignUp.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/13/23.
//

import SwiftUI

struct SignUp: View {
    // MARK: - PROPERTIES
    let title: String
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text(title).font(.body)
                .padding(.horizontal, 10)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(title: "Welcome to Inkly!").previewLayout(.sizeThatFits).padding()
    }
}
