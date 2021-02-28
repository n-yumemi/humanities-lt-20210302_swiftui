//
//  Model.swift
//  TODO App
//
//  Created by yumemi narawa on 2021/01/27.
//

import Foundation
import Firebase

struct Todo: Identifiable {
    var id: String = UUID().uuidString
    var text: String
    var date: Date
}

class Model: ObservableObject {
    
    @Published var todos = [Todo]()
    
    var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("todos").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.todos = documents.map { (queryDocumentSnapshot) -> Todo in
                let data = queryDocumentSnapshot.data()
                let text = data["text"] as? String ?? ""
                let date = data["date"] as? Date
              
                print("text:", text)
                return Todo(text: text, date: date)
            }
        }
    }
}
