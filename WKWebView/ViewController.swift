//
//  ViewController.swift
//  WKWebView
//
//  Created by Can Balkaya on 1/18/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var articles = [ArticleItem]()
    var urlText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "articles", withExtension: "json")
        if let url = url {
            let data = try? Data(contentsOf: url)
            
            do {
                guard let data = data else { return }
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                let articleArray = json?.value(forKey: "articles") as! NSArray
                for data in articleArray {
                    let article = data as! [String: Any]
                    guard let image = article["image"] else { return }
                    guard let caption = article["caption"] else { return }
                    guard let title = article["title"] else { return }
                    guard let url = article["url"] else { return }
                    
                    articles.append(ArticleItem(image: image as! String, caption: caption as! String, title: title as! String, url: url as! String))
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toArticleVC" {
            let destinationVC = segue.destination as! ArticleVC
            destinationVC.urlText = urlText
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let article = articles[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCollectionViewCell {
            
            let url = URL(string: article.image)
            let request = URLRequest(url: url!)
            cell.webView.load(request)
            
            cell.captionLabel.text = article.caption
            cell.titleLabel.text = article.title
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        urlText = articles[indexPath.row].url
        performSegue(withIdentifier: "toArticleVC", sender: nil)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.view.frame.width - 16.0 * 2
        let height: CGFloat = 234.0
        
        return CGSize(width: width, height: height)
    }
}
