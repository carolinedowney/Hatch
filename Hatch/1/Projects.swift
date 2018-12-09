//
//  Projects.swift
//  Hatch
//
//  Created by Caroline Downey on 12/4/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

import Foundation
import Firebase

class Projects {
    
    var projectArray = [Project]()
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completed: @escaping () -> ())  {
        db.collection("projects").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("*** ERROR: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.projectArray = []
            // there are querySnapshot!.documents.count documents in teh spots snapshot
            for document in querySnapshot!.documents {
                // You'll have to be sure you've created an initializer in the singular class (Spot, below) that acepts a dictionary.
                let project = Project(dictionary: document.data())
                project.documentID = document.documentID
                self.projectArray.append(project)
            }
            completed()
        }
    }
    
}
