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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "OPen", style: .plain, target: self, action: #selector(openTapped))
    }
    
    @objc func openTapped(){
        let alert = UIAlertController(title: "Open ", message: nil , preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "apple.com", style: .default , handler: openPage))
        alert.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true, completion: nil)
        
    }
    func openPage(action:UIAlertAction){
        print(action.title)
        if let w = action.title{
            var url = URL(string: "https://"+w)!
            web.load(URLRequest(url: url))
        }
    }
    
    

}

