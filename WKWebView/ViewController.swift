//
//  ViewController.swift
//  WKWebView
//
//  Created by Can Balkaya on 1/18/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.turkishkit.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
