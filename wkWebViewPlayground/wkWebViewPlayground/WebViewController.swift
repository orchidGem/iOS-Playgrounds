//
//  WebViewController.swift
//  wkWebViewPlayground
//
//  Created by Laura Evans on 1/13/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!

    @IBOutlet weak var progressBar: UIProgressView!
    override func loadView() {
        view = webView
        webView.uiDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - WebViewDelegate
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
        guard let targetURL = navigationAction.request.url else {
            print("error with URL")
            return nil
        }
        
        let newRequest = URLRequest(url: targetURL)
        webView.load(newRequest)
        
        return nil;
    }
  
}
