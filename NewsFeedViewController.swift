//
//  NewsFeedViewController.swift
//  TOPStoriesAssestmentReview
//
//  Created by Melinda Diaz on 2/6/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    private let newsFeedView = NewsFeedView()
    
    override func loadView() {
        view = newsFeedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground //white when darkmode is off, black when dark mode is on
        
        //setting up collection view dataSource = self
        
        newsFeedView.collectionView.delegate = self
        newsFeedView.collectionView.dataSource = self
        // COMPILER ERRORcould not dequeue a view of kind: UICollectionElementKindCell with identifier articleCell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard'
//So you need to register in order for this error to go away
        newsFeedView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "articleCell")
    }
    

   
}
extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath)
        cell.backgroundColor = .white //use this to help you see the cells when there
        return cell
    }
    
    
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    //return item size
    //item size = 30% of the height of the debvice
    //item width = 100% of the device
    //this is where you make the size for the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //we capture this in a constant
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.3
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
