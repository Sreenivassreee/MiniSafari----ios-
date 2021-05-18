//
//  ViewController.swift
//  MiniSafari
//
//  Created by Sreenivas k on 18/05/21.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    var web = WKWebView()
    override func loadView() {
    
        web.navigationDelegate = self
        view = web
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.hackingwithswift.com")!
        web.load(URLRequest(url: url))!
        web.allowsBackForwardNavigationGestures = true
    }


}

