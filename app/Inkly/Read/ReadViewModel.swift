//
//  ReadViewModel.swift
//  inkly
//
//  Created by Tanya Garg on 10/14/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

struct LogPrompt: Identifiable {
    var id = UUID()  // Each prompt will have a unique id
    var question: String
    var answer: String
}

struct DateEntry: Identifiable {
    var id: String  // Date will be the id for each DateEntry
    var prompts: [LogPrompt]
}

class ReadViewModel: ObservableObject{
    
    @Published var dateEntries: [DateEntry] = []
    private let ref = Database.database().reference()
    
    func readDataFromDatabase(uid: String, completion: @escaping () -> Void) {
            let dailyEntriesRef = ref.child("users").child(uid).child("dailyEntries")

            dailyEntriesRef.observeSingleEvent(of: .value) { snapshot, error in
                if let error = error {
                    print("Error reading data from the database: \(error)")
                    completion()
                    return
                }

                guard let entriesDict = snapshot.value as? [String: [String: [String: String]]] else {
                    print("Data is not in the expected format.")
                    completion()
                    return
                }

                // Process entriesDict to populate dateEntries
                self.dateEntries = entriesDict.map { (date, promptsDict) in
                    let prompts = promptsDict.values.map {
                        LogPrompt(question: $0["question"] ?? "", answer: $0["answer"] ?? "")
                    }
                    return DateEntry(id: date, prompts: prompts)
                }
                completion()
            }
        }
    
    
    func fetchUserStats(uid: String, completion: @escaping ([String: Any]?) -> Void) {
        // Reference to the "stats" node for the specified user
        let statsRef = ref.child("users").child(uid).child("stats")
        
        statsRef.observeSingleEvent(of: .value) { snapshot, error in
            if let error = error {
                print("Error fetching user stats: \(error)")
                completion(nil)
                return
            }
            
            if let statsData = snapshot.value as? [String: Any] {
                completion(statsData)
            } else {
                completion(nil)
            }
        }
    }
    
    func fetchUserStickers(uid: String, completion: @escaping ([String]?) -> Void) {
        // Reference to the "stats" node for the specified user
        let stickerRef = ref.child("users").child(uid).child("stickers")
        
        stickerRef.observeSingleEvent(of: .value) { snapshot, error in
            if let error = error {
                print("Error fetching user stickers: \(error)")
                completion(nil)
                return
            }
            
            if let stickers = snapshot.value as? [String] {
                print("Fetched stickers \(stickers)")
                completion(stickers)
            } else {
                completion(nil)
            }
        }
    }
    
    func fetchLatestEntry(for uid: String, completion: @escaping (String?) -> Void) {
            let dailyEntriesRef = ref.child("users").child(uid).child("dailyEntries")
            
            dailyEntriesRef.observeSingleEvent(of: .value) { snapshot in
                guard let entries = snapshot.value as? [String: [String: [String: String]]] else {
                    completion(nil)
                    return
                }
                
                let latestDate = entries.keys.sorted().last
                if let date = latestDate, let prompts = entries[date] {
                    let prompt1Answer = prompts["prompt1"]?["answer"] ?? ""
                    let prompt2Answer = prompts["prompt2"]?["answer"] ?? ""
                    let combined = prompt1Answer + " " + prompt2Answer
                    completion(combined)
                } else {
                    completion(nil)
                }
            }
        }

}

