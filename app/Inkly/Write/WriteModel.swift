//
//  WriteModel.swift
//  Inkly
//
//  Created by Tanya Garg on 10/14/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class WriteViewModel: ObservableObject{
    
    private let ref = Database.database().reference()
    
    func pushDataToDatabase(_ content: String, _ date: Date,_ uid: String, _ prompt: String, _ key: String) {
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd" // You can change the format to your preference

            let dateString = dateFormatter.string(from: date)
       
        let entry = [
            "answer": content,
            "question": prompt
        ]
        
        let userRef = ref.child("users").child(uid)
        let dailyEntriesRef = userRef.child("dailyEntries").child(dateString)
        
        dailyEntriesRef.child(key).setValue(entry)
        updateStats(uid: uid)

    }
    
    private func updateStats(uid: String) {
        // Reference to the user's stats node
        let userStatsRef = ref.child("users").child(uid).child("stats")

        // Calculate streak and total entries (you need to fetch existing data)
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = dateFormatter.string(from: currentDate)
        
        let yesterdayDateString = "2001-01-17"
        if let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) {
            let yesterdayDateString = dateFormatter.string(from: yesterday)
        }

        userStatsRef.observeSingleEvent(of: .value) { snapshot in
            var streak = 0
            var totalEntries = 0

            if snapshot.exists() {
                if let statsData = snapshot.value as? [String: Any] {
                    if let lastEntryDate = statsData["lastEntryDate"] as? String {
                        if lastEntryDate == yesterdayDateString {
                            // User submitted an entry yesterday, increment streak
                            streak = (statsData["streak"] as? Int ?? 0) + 1
                        } else {
                            // User didn't submit an entry yesterday, reset streak
                            streak = 1
                        }
                    }

                    // Update total entries
                    totalEntries = (statsData["numOfEntries"] as? Int ?? 0) + 1
                }
            } else {
                // The stats node doesn't exist, create it
                streak = 1
                totalEntries = 1
            }

            // Update the stats node with the new values
            userStatsRef.setValue(["streak": streak, "numOfEntries": totalEntries, "lastEntryDate": currentDateString])
        }
    }

    
}
