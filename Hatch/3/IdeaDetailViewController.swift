//
//  TextIdeaDetailViewController.swift
//  Hatch
//
//  Created by Caroline Downey on 12/2/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

import UIKit

class IdeaDetailViewController: UIViewController {

    

    @IBOutlet weak var ideaNameTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var idea: Idea!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if idea == nil {
            idea = Idea()
        }
        ideaNameTextField.text = idea.idea
        textView.text = idea.ideaDescription

    }
    
    func updateDataFromInterface() {
        idea.idea = ideaNameTextField.text!
        idea.ideaDescription = textView.text!
    }

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        updateDataFromInterface()
        idea.saveData { success in
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
    



