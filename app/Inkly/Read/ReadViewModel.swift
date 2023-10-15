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
    
    
//    func readDataFromDatabase(uid: String, date: String, completion: @escaping ([String: [String: String]]) -> Void) {
//        // Reference to the "dailyEntries" node for the specified user and date
//        let dailyEntriesRef = ref.child("users").child(uid).child("dailyEntries").child(date)
//        
//        dailyEntriesRef.observeSingleEvent(of: .value) { snapshot, error in
//            if let error = error {
//                print("Error reading data from the database: \(error)")
//                completion([:])
//                return
//            }
//            
//            if let entriesDict = snapshot.value as? [String: [String: String]] {
//                completion(entriesDict)
//            } else {
//                completion([:])
//            }
//        }
//    }
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

}

