//
//  PhaseThreeViewController.swift
//  Hatch
//
//  Created by Caroline Downey on 12/2/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//
//
//import UIKit
//
//
//class CommentViewController: UIViewController {
//    
//    @IBOutlet weak var editBarButton: UIBarButtonItem!
//    @IBOutlet weak var addBarButton: UIBarButtonItem!
//
//    @IBOutlet weak var commentsTableView: UITableView!
//
//    var commentsArray = ["comment1", "comment2", "comment3"]
//    var commentDetails = ["hi", "cool", "awesome"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        commentsTableView.delegate = self
//        commentsTableView.dataSource = self
//    }
//
//    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowComment" {
//            let destination = segue.destination as! CommentDetailViewController
//            let index = commentsTableView.indexPathForSelectedRow!.row
//            destination.commentItem = commentsArray[index]
//            destination.commentNoteItem = commentDetails[index]
//        } else {
//            if let selectedPath = commentsTableView.indexPathForSelectedRow {
//                commentsTableView.deselectRow(at: selectedPath, animated: false)
//            }
//        }
//    }
//
//    @IBAction func unwindFromCommentDetailViewController(segue: UIStoryboardSegue) {
//        let sourceViewController = segue.source as! CommentDetailViewController
//        if let indexPath = commentsTableView.indexPathForSelectedRow {
//            commentsArray[indexPath.row] = sourceViewController.commentItem!
//            commentDetails[indexPath.row] = sourceViewController.commentNoteItem!
//            commentsTableView.reloadRows(at: [indexPath], with: .automatic)
//        } else {
//            let newIndexPath = IndexPath(row: commentsArray.count, section: 0)
//            commentsArray.append(sourceViewController.commentItem!)
//            commentDetails.append(sourceViewController.commentNoteItem!)
//            commentsTableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
//    }
//
//
//    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
//        if commentsTableView.isEditing {
//            commentsTableView.setEditing(false, animated: true)
//            addBarButton.isEnabled = true
//            editBarButton.title = "Edit"
//        } else {
//            commentsTableView.setEditing(true, animated: true)
//            addBarButton.isEnabled = false
//            editBarButton.title = "Done"
//        }
//    }
//
//}
//
//extension CommentViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return commentsArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = commentsTableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath)
//
//        cell.textLabel?.text = commentsArray[indexPath.row]
//        cell.detailTextLabel?.text = commentDetails[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            commentsArray.remove(at: indexPath.row)
//            commentDetails.remove(at: indexPath.row)
//            commentsTableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let itemToMove = commentsArray[sourceIndexPath.row]
//        let noteToMove = commentDetails[sourceIndexPath.row]
//        commentsArray.remove(at: sourceIndexPath.row)
//        commentDetails.remove(at: sourceIndexPath.row)
//        commentsArray.insert(itemToMove, at: destinationIndexPath.row)
//        commentDetails.insert(noteToMove, at: destinationIndexPath.row)
//    }
//}
//
//
