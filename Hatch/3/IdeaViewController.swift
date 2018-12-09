//
//  TextIdeaViewController.swift
//  Hatch
//
//  Created by Caroline Downey on 12/2/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

import UIKit
import Firebase


class IdeaViewController: UIViewController {
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var ideas: Ideas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ideas = Ideas()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        ideas.loadData {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowIdea" {
            let destination = segue.destination as! IdeaDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.idea = ideas.ideaArray[selectedIndexPath.row]
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
  
}

extension IdeaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideas.ideaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdeaCell", for: indexPath)
        cell.textLabel?.text = ideas.ideaArray[indexPath.row].idea
        cell.detailTextLabel?.text = ideas.ideaArray[indexPath.row].ideaDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
