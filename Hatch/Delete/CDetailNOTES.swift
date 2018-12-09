//
//  CommentDetailViewController.swift
//  Hatch
//
//  Created by Caroline Downey on 12/3/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

//import UIKit
//
//class CommentDetailViewController: UIViewController {
//    
//    @IBOutlet weak var saveBarButton: UIBarButtonItem!
//    @IBOutlet weak var commentTextField: UITextField!
//    @IBOutlet weak var commenttextView: UITextView!
//    
//    var commentItem: String?
//    var commentNoteItem: String?
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        super.viewDidLoad()
//        if let ideaItem = commentItem {
//            commentTextField.text = ideaItem
//        }
//        if let ideaNoteItem = commentNoteItem {
//            commenttextView.text = ideaNoteItem
//        }
//        enableDisableSaveButton()
//        commentTextField.becomeFirstResponder()
//        
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "UnwindFromSave" {
//            commentItem = commentTextField.text
//            commentNoteItem = commenttextView.text
//        }
//    }
//    
//    func enableDisableSaveButton() {
//        if let commentFieldCount = commentTextField.text?.count, commentFieldCount > 0 {
//            saveBarButton.isEnabled = true
//        } else {
//            saveBarButton.isEnabled = false
//        }
//    }
//    
//    
//    @IBAction func commentTextFieldChanged(_ sender: UITextField) {
//        enableDisableSaveButton()
//    }
//    
//    
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
//    
//    
//}
