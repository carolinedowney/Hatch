//
//  PhaseTwoViewController.swift
//  Hatch
//
//  Created by Caroline Downey on 12/2/18.
//  Copyright © 2018 Caroline Downey. All rights reserved.
//

import UIKit
import WebKit

class PhaseTwoViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.drive.google.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        

    }
    
    @IBAction func goBackPressed(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func goForwardPressed(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
