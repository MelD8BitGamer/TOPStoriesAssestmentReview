//
//  NewsFeedView.swift
//  TOPStoriesAssestmentReview
//
//  Created by Melinda Diaz on 2/6/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//


import UIKit

class NewsFeedView: UIView {
    
    public lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        //has the user use only lowercased if they typed capital case
        sb.autocapitalizationType = .none
        sb.placeholder = "Search for article"
        return sb
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //this is more for the collectionview and tableview background more like a cream grey color and good for darkmode
        cv.backgroundColor = .systemGroupedBackground
        return cv
    }()
    //TODO: finish the newsImageView and the other private func
    public lazy var newsImageView: UIImageView = {
        let image = UIImageView()
        return image
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
        setUpSearchBarConstraints()
        setupCollectionViewConstraints()
        setupNewsImageViewConstraints()
    }
    
    private func setUpSearchBarConstraints() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
    private func setupCollectionViewConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        
        ])
        
    
    }
    
    private func setupNewsImageViewConstraints(){
      addSubview(newsImageView)
       
      newsImageView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         
        newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
        newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        newsImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier:0.50),
        newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor)
         
         
      ])
    }
    
    //need other constraints
}

