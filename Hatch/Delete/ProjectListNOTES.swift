////
////  ProjectListViewController.swift
////  Hatch
////
////  Created by Caroline Downey on 12/3/18.
////  Copyright © 2018 Caroline Downey. All rights reserved.
////
//
//import UIKit
//import Firebase
//import FirebaseUI
//import GoogleSignIn  // used to be called FirebaseGoogleAuthUI
//
//
//class ProjectListViewController: UIViewController {
//
//
//
//
//    @IBOutlet weak var editBarButton: UIBarButtonItem!
//    @IBOutlet weak var addBarButton: UIBarButtonItem!
//
//
//    @IBOutlet weak var tableView: UITableView!
//
//
//    var projectsArray = ["project 1", "project 2", "project 3"]
//    var descriptionsArray = ["nice", "cool", "fun"]
//
//    var authUI: FUIAuth!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        authUI = FUIAuth.defaultAuthUI()
//        authUI?.delegate = self
//
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.isHidden = true
//
//    }
//
//
//
//    // Be sure to call this from viewDidAppear
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        signIn()
//    }
//
//    // Nothing should change unless you add different kinds of authentication.
//    func signIn() {
//        let providers: [FUIAuthProvider] = [
//            FUIGoogleAuth(),
//            ]
//        if authUI.auth?.currentUser == nil {
//            self.authUI?.providers = providers
//            present(authUI.authViewController(), animated: true, completion: nil)
//        } else {
//            tableView.isHidden = false
//        }
//    }
//
//
//    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
//        do {
//            try authUI!.signOut()
//            print("^^^ Successfully signed out!")
//            tableView.isHidden = true
//            signIn()
//        } catch {
//            tableView.isHidden = true
//            print("*** ERROR: Couldn't sign out")
//        }
//    }
//
//
//
//
//    // code I looked up:
//    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    //        if let destination = (segue.destination as? UITabBarController)?.viewControllers!.first as? ProjectDescriptionViewController {
//    //
//    //            destination.projectName = projectsArray[(projectTableView.indexPathForSelectedRow?.row)!]
//    //
//    //        }
//    //    }
//
//
//    //old code:
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowProject" {
//            let destination = segue.destination as! ProjectDescriptionViewController
//            let index = tableView.indexPathForSelectedRow!.row
//            destination.projectName = projectsArray[index]
//            destination.projectDescription = descriptionsArray[index]
//        } else {
//            if let selectedPath = tableView.indexPathForSelectedRow {
//                tableView.deselectRow(at: selectedPath, animated: false)
//            }
//        }
//    }
//
//    @IBAction func unwindFromProjectDescriptionViewController(segue: UIStoryboardSegue) {
//        let sourceViewController = segue.source as! ProjectDescriptionViewController
//        if let indexPath = tableView.indexPathForSelectedRow {
//            projectsArray[indexPath.row] = sourceViewController.projectName!
//            descriptionsArray[indexPath.row] = sourceViewController.projectDescription!
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//        } else {
//            let newIndexPath = IndexPath(row: projectsArray.count, section: 0)
//            projectsArray.append(sourceViewController.projectName!)
//            descriptionsArray.append(sourceViewController.projectDescription!)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
//    }
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
//
//
//
//}
//
//extension ProjectListViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return projectsArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
//        cell.textLabel?.text = projectsArray[indexPath.row]
//        cell.detailTextLabel?.text = descriptionsArray[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            projectsArray.remove(at: indexPath.row)
//            descriptionsArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let itemToMove = projectsArray[sourceIndexPath.row]
//        let noteToMove = descriptionsArray[sourceIndexPath.row]
//        projectsArray.remove(at: sourceIndexPath.row)
//        descriptionsArray.remove(at: sourceIndexPath.row)
//        projectsArray.insert(itemToMove, at: destinationIndexPath.row)
//        descriptionsArray.insert(noteToMove, at: destinationIndexPath.row)
//    }
//
//
//}
