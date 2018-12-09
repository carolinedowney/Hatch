//
//  ProjectDescriptionViewController.swift
//  Hatch
//
//  Created by Caroline Downey on 12/3/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

import UIKit

class ProjectDescriptionViewController: UIViewController {
    
    
    @IBOutlet weak var projectNameField: UITextField!
    @IBOutlet weak var projectDescriptionView: UITextView!
    
    var project: Project!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if project == nil {
            project = Project()
        }
        projectNameField.text = project.project
        projectDescriptionView.text = project.projectDescription
        
    }
    
    func updateDataFromInterface() {
        project.project = projectNameField.text!
        project.projectDescription = projectDescriptionView.text!
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        updateDataFromInterface()
        project.saveData { success in
            if success {
                self.leaveViewController()
            } else {
                print("*** ERROR: Couldn't leave this view controller because data wasn't saved.")
            }
        }
    }
    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    

    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    
    


    
}
