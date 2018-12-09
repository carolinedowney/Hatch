//
//  ProjectListViewController.swift
//  Hatch
//
//  Created by Caroline Downey on 12/3/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

import UIKit
import Firebase


class ProjectListViewController: UIViewController {
    

    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var projects: Projects!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        projects = Projects()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        projects.loadData {
            self.tableView.reloadData()
        }
    }
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowProject" {
//            let destination = segue.destination as! ProjectDescriptionViewController
//            let selectedIndexPath = tableView.indexPathForSelectedRow!
//            destination.project = projects.projectArray[selectedIndexPath.row]
//        } else {
//            if let selectedPathIndex = tableView.indexPathForSelectedRow {
//                tableView.deselectRow(at: selectedPathIndex, animated: true)
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProject" {
            print("show project segue")
                        let destination = segue.destination as! ProjectDescriptionViewController
                        let index = tableView.indexPathForSelectedRow!
                        destination.project = projects.projectArray[index.row]
        } else {
            if let selectedPathIndex = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPathIndex, animated: true)
            }
        }
    }
    
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
//        @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
//            if tableView.isEditing {
//                tableView.setEditing(false, animated: true)
//                addBarButton.isEnabled = true
//                editBarButton.title = "Edit"
//            } else {
//                tableView.setEditing(true, animated: true)
//                addBarButton.isEnabled = false
//                editBarButton.title = "Done"
//            }
//        }
    
    
}


extension ProjectListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.projectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
        cell.textLabel?.text = projects.projectArray[indexPath.row].project
        cell.detailTextLabel?.text = projects.projectArray[indexPath.row].projectDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            if editingStyle == .delete {
//            projects.projectArray.remove(at: indexPath.row)
//// projects.projectArray.projectDescription.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
//        }

    
    
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let itemToMove = projects.projectArray[sourceIndexPath.row].project
//        projects.projectArray.remove(at: sourceIndexPath.row)
//        projects.projectArray.insert(itemToMove, at: destinationIndexPath)
//    }
    

    
}

