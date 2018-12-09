//
//  NOTES.swift
//  Hatch
//
//  Created by Caroline Downey on 12/3/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

//import UIKit
//import Firebase
//
//
//class IdeaViewController: UIViewController {
//
//
//    @IBOutlet weak var editBarButton: UIBarButtonItem!
//    @IBOutlet weak var addBarButton: UIBarButtonItem!
//    @IBOutlet weak var tableView: UITableView!
//    
//
//
//    var ideasArray = ["idea 1", "idea 2", "idea 3"]
//    var ideaDescriptions = ["hi", "notes", "yay"]
//
//    var idea: String
//    var ideaDescription: String
//    var postingUserID: String
//    var documentID: String
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
//    }
//
//
//    var dictionary: [String: Any] {
//        return ["idea": idea, "ideaDescription": ideaDescription, "postingUserID": postingUserID]
//    }
//
//    let db = Fires
//
//
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowIdea" {
//            let destination = segue.destination as! IdeaDetailViewController
//            let index = tableView.indexPathForSelectedRow!.row
//            destination.ideaItem = ideasArray[index]
//            destination.ideaNoteItem = ideaDescriptions[index]
//        } else {
//            if let selectedPath = tableView.indexPathForSelectedRow {
//                tableView.deselectRow(at: selectedPath, animated: false)
//            }
//        }
//    }
//
//    @IBAction func unwindFromIdeaDetailViewController(segue: UIStoryboardSegue) {
//        let sourceViewController = segue.source as! IdeaDetailViewController
//        if let indexPath = tableView.indexPathForSelectedRow {
//            ideasArray[indexPath.row] = sourceViewController.ideaItem!
//            ideaDescriptions[indexPath.row] = sourceViewController.ideaNoteItem!
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//        } else {
//            let newIndexPath = IndexPath(row: ideasArray.count, section: 0)
//            ideasArray.append(sourceViewController.ideaItem!)
//            ideaDescriptions.append(sourceViewController.ideaNoteItem!)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
//    }
//
//
//    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
//        if tableView.isEditing {
//            tableView.setEditing(false, animated: true)
//            addBarButton.isEnabled = true
//            editBarButton.title = "Edit"
//        } else {
//            tableView.setEditing(true, animated: true)
//            addBarButton.isEnabled = false
//            editBarButton.title = "Done"
//        }
//    }
//
//
//
//}
//
//extension IdeaViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ideasArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "IdeaCell", for: indexPath)
//
//        cell.textLabel?.text = ideasArray[indexPath.row]
//        cell.detailTextLabel?.text = ideaDescriptions[indexPath.row]
//        return cell
//    }
//
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            ideasArray.remove(at: indexPath.row)
//            ideaDescriptions.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let itemToMove = ideasArray[sourceIndexPath.row]
//        let noteToMove = ideaDescriptions[sourceIndexPath.row]
//        ideasArray.remove(at: sourceIndexPath.row)
//        ideaDescriptions.remove(at: sourceIndexPath.row)
//        ideasArray.insert(itemToMove, at: destinationIndexPath.row)
//        ideaDescriptions.insert(noteToMove, at: destinationIndexPath.row)
//    }
//
//}
//
//
