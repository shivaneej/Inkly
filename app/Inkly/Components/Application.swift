//
//  Application.swift
//  Inkly
//
//  Created by Shivanee Jaiswal on 10/13/23.
//

import SwiftUI
import UIKit

final class ApplicationUtility {
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
