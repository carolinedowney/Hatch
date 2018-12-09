//
//  Ideas.swift
//  Hatch
//
//  Created by Caroline Downey on 12/3/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

import Foundation
import Firebase

class Ideas {
    
    var ideaArray = [Idea]()
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completed: @escaping () -> ())  {
        db.collection("ideas").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("*** ERROR: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.ideaArray = []
            // there are querySnapshot!.documents.count documents in teh spots snapshot
            for document in querySnapshot!.documents {
                let idea = Idea(dictionary: document.data())
               idea.documentID = document.documentID
                self.ideaArray.append(idea)
            }
            completed()
        }
    }
    
}
