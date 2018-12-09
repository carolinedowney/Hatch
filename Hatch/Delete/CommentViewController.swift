////
////  PhaseThreeViewController.swift
////  Hatch
////
////  Created by Caroline Downey on 12/2/18.
////  Copyright © 2018 Caroline Downey. All rights reserved.
////
//
//import UIKit
//
//
//class CommentViewController: UIViewController {
//
//
//    
//    @IBOutlet weak var tableView: UITableView!
//
//    var comments: Comments!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        tableView.delegate = self
////        tableView.dataSource = self
//        
//        comments = Comments()
//        comments.commentArray.append(Comment(comment: "I love that idea!", commentDescription: "really cool use of color in the text field and I love the photo that goes along with it too! Nice work", postingUserID: "", documentID: ""))
//        comments.commentArray.append(Comment(comment: "I like it, but...", commentDescription: "not totally my favorite thing, I would like to see less color", postingUserID: "", documentID: ""))
//        comments.commentArray.append(Comment(comment: "Good, but the powerpoint needs work!", commentDescription: "nice copy and image ideas but I don't like the presentation", postingUserID: "", documentID: ""))
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowComment" {
//            let destination = segue.destination as! CommentDetailViewController
//            let selectedIndexPath = tableView.indexPathForSelectedRow!
//            destination.comment = comments.commentArray[selectedIndexPath.row]
//        } else {
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                tableView.deselectRow(at: selectedIndexPath, animated: true)
//            }
//        }
//    }
//}
//
//extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return comments.commentArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath)
//        cell.textLabel?.text = comments.commentArray[indexPath.row].comment
//        cell.detailTextLabel?.text = comments.commentArray[indexPath.row].commentDescription
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    
//}







