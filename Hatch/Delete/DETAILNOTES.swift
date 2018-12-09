////
////  TextIdeaDetailViewController.swift
////  Hatch
////
////  Created by Caroline Downey on 12/2/18.
////  Copyright © 2018 Caroline Downey. All rights reserved.
////
//
//import UIKit
//
//class IdeaDetailViewController: UIViewController {
//    
//    
//    @IBOutlet weak var saveBarButton: UIBarButtonItem!
//    @IBOutlet weak var ideaNameTextField: UITextField!
//    @IBOutlet weak var textView: UITextView!
//    
//    var ideaItem: String?
//    var ideaNoteItem: String?
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let ideaItem = ideaItem {
//            ideaNameTextField.text = ideaItem
//        }
//        if let ideaNoteItem = ideaNoteItem {
//            textView.text = ideaNoteItem
//        }
//        enableDisableSaveButton()
//        ideaNameTextField.becomeFirstResponder()
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "UnwindFromSave" {
//            ideaItem = ideaNameTextField.text
//            ideaNoteItem = textView.text
//        }
//    }
//    
//    func enableDisableSaveButton() {
//        if let ideaFieldCount = ideaNameTextField.text?.count, ideaFieldCount > 0 {
//            saveBarButton.isEnabled = true
//        } else {
//            saveBarButton.isEnabled = false
//        }
//    }
//    
//    @IBAction func ideaFieldChanged(_ sender: UITextField) {
//        enableDisableSaveButton()
//    }
//    
//    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
//        //        let isPresentingInAddMode = presentingViewController is UINavigationController
//        //        if isPresentingInAddMode {
//        //            dismiss(animated: true, completion: nil)
//        //        } else {
//        //            navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
//    }
//    
//    
//}

