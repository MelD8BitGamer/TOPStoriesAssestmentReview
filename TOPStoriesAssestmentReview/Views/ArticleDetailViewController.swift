//
//  ArticleDetailViewController.swift
//  TOPStoriesAssestmentReview
//
//  Created by Melinda Diaz on 2/7/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit
import ImageKit

class ArticleDetailViewController: UIViewController {
    
    
    public var article: Article?
    private let detailedView = ArticleDetailView()
    //it is not in ViewDidLoad cause you will get weird behavior
    override func loadView() {
        view = detailedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        updateUI()
        
        //here we are programactically adding a UIBAr Button Item, to the right side of the navigation bar title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(saveArticleButtonPressed(_:)))
    }
    
    private func updateUI() {
        guard let article = article else {
            fatalError("did not load an article")
        }
        navigationItem.title = article.title
        detailedView.abstractHeadline.text = article.abstract
        detailedView.newsImageView.getImage(with: article.getArticleIMageURL(for: .superJumbo)) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.detailedView.newsImageView.image = UIImage(named: "exclamationmark-octagon")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailedView.newsImageView.image = image
                }
            }
            
            
        }
    }
    @objc func saveArticleButtonPressed(_ sender: UIBarButtonItem) {
        print ("save article button pressed")
    }
    
}
