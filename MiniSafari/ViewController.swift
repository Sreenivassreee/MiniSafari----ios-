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
  
    var progressView: UIProgressView!
    
    override func loadView() {
        web = WKWebView()
        web.navigationDelegate = self
        view = web
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      web.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        web.load(URLRequest(url: url))!
        web.allowsBackForwardNavigationGestures = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: web, action: #selector(web.reload))
        
        
        navigationController?.isToolbarHidden = false
        
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        var progressBtn = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressBtn, spacer,refresh]
        
    
    }
    
    @objc func openTapped(){
        let alert = UIAlertController(title: "Open ", message: nil , preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "apple.com", style: .default , handler: openPage))
        alert.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true, completion: nil)
        
    }
    func openPage(action:UIAlertAction){
        
        if let w = action.title{
            var url = URL(string: "https://"+w)!
            web.load(URLRequest(url: url))
  
        }
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = web.title
    }
    
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            print(keyPath!)
          
//            progressView.progress = Float(web.estimatedProgress)
//            progressView.progress = Float(web.estimatedProgress)
        }
    }
   
}

