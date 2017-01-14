//
//  ViewController.swift
//  wkWebViewPlayground
//
//  Created by Laura Evans on 1/13/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Properties
    
    var webView: WKWebView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        progressBar.isHidden = true
        progressBar.setProgress(0, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create and configure Webview
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebView" {
            
            let webViewController = segue.destination as! WebViewController
            webViewController.webView = webView
        }
    }
    
    
    // MARK: - Observer
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if (keyPath == "estimatedProgress") {
            
            progressBar.isHidden = false
            progressBar.setProgress(Float(webView.estimatedProgress), animated: true)
            
            if webView.estimatedProgress == 1 {
                
                if progressBar.progress == 1 {
                    webView.removeObserver(self, forKeyPath: "estimatedProgress")
                    performSegue(withIdentifier: "showWebView", sender: self)
                }
                
            } else {
                print("loaded \(webView.estimatedProgress)%")
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func showWebView(_ sender: Any) {
        // create URL
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil) // add observer for key path
        let myURL = URL(string: "https://www.asos.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }


}

