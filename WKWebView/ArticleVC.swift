//
//  ArticleVC.swift
//  WKWebView
//
//  Created by Can Balkaya on 1/18/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import UIKit
import WebKit

class ArticleVC: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var urlText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: urlText)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
