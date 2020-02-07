//
//  ArticleDetailView.swift
//  TOPStoriesAssestmentReview
//
//  Created by Melinda Diaz on 2/7/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class ArticleDetailView: UIView {
    //image view
    //abstract headline
    //byline
    //date
    
    public lazy var newsImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo")
        iv.backgroundColor = .systemYellow //for testing
        //this puts the picture as a fill instead of aspect fit
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    public lazy var abstractHeadline: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        //subheadline is good fo rthe same as above
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Abstract Headline"
        //label.textAlignment = .left (if you want an allignment)
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpNewsImageConstraints()
        setUpAbstractHeadlineConstraints()
    }
    
    //setUp constraints
    private func setUpNewsImageConstraints() {
        addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.40)
            
        ])
    }
    
    private func setUpAbstractHeadlineConstraints() {
        addSubview(abstractHeadline)
        abstractHeadline.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            abstractHeadline.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8),
            abstractHeadline.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            abstractHeadline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        
        ])
}
    
}
