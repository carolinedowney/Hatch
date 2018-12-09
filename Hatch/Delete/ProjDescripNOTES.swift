//
//  ProjectDescriptionViewController.swift
//  Hatch
//
//  Created by Caroline Downey on 12/3/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

//import UIKit
//
//class ProjectDescriptionViewController: UIViewController {
//
//
//    @IBOutlet weak var projectNameField: UITextField!
//    @IBOutlet weak var projectDescriptionView: UITextView!
//
//    var projectName: String?
//    var projectDescription: String?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        if let projectName = projectName {
//            projectNameField.text = projectName
//        }
//    }
//
//    // this goes back to the main screen but i need to figure out how to just move it one view back!
//    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
//    }
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "UnwindFromSave" {
//            projectName = projectNameField.text
//            projectDescription = projectDescriptionView.text
//        }
//    }
//
//
//    @IBAction func projectNameChanged(_ sender: UITextField) {
//    }
//
//
//
//
//
//}
