//
//  Project.swift
//  Hatch
//
//  Created by Caroline Downey on 12/4/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

import Foundation
import Firebase
import FirebaseUI

class Project {
    
    var project: String
    var projectDescription: String
    var postingUserID: String
    var documentID: String
    
    
    var dictionary: [String: Any] {
        return ["project": project, "projectDescription": projectDescription, "postingUserID": postingUserID]
    }
    
    init(project: String, projectDescription: String, postingUserID: String, documentID: String) {
        self.project = project
        self.projectDescription = projectDescription
        self.postingUserID = postingUserID
        self.documentID = documentID
    }
    
    convenience init() {
        self.init(project: "", projectDescription: "", postingUserID: "", documentID: "")
    }
    
    convenience init(dictionary: [String: Any]) {
        let project = dictionary["project"] as! String? ?? ""
        let projectDescription = dictionary["projectDescription"] as! String? ?? ""
        let postingUserID = dictionary["postingUserID"] as! String? ?? ""
        self.init(project: project, projectDescription: projectDescription, postingUserID: postingUserID, documentID: "")
    }
    

    func saveData(completion: @escaping (Bool) -> ())  {
        let db = Firestore.firestore()
        // Grab the user ID
        guard let postingUserID = (Auth.auth().currentUser?.uid) else {
            print("*** ERROR: Could not save data because we don't have a valid postingUserID")
            return completion(false)
        }
        self.postingUserID = postingUserID
        // Create the dictionary representing data we want to save
        let dataToSave: [String: Any] = self.dictionary
        // if we HAVE saved a record, we'll have an ID
        if self.documentID != "" {
            let ref = db.collection("projects").document(self.documentID)
            ref.setData(dataToSave) { (error) in
                if let error = error {
                    print("ERROR: updating document \(error.localizedDescription)")
                    completion(false)
                } else { // It worked!
                    completion(true)
                }
            }
        } else { // Otherwise create a new document via .addDocument
            var ref: DocumentReference? = nil // Firestore will creat a new ID for us
            ref = db.collection("projects").addDocument(data: dataToSave) { (error) in
                if let error = error {
                    print("ERROR: adding document \(error.localizedDescription)")
                    completion(false)
                } else { // It worked! Save the documentID in Spot’s documentID property
                    self.documentID = ref!.documentID
                    completion(true)
                }
            }
        }
    }
    
    
}
