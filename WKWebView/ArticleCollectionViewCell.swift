//
//  ArticleCollectionViewCell.swift
//  WKWebView
//
//  Created by Can Balkaya on 1/18/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import UIKit
import WebKit

class ArticleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
