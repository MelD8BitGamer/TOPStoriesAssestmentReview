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
    
    private var newsArticles = [Article]() {
        //we need a did set cause we need to load our collection view
        didSet {
            //we need a dispatchcall because we are coming from the main thread and we need to get it out of the background thread
            DispatchQueue.main.async {
                self.newsFeedView.collectionView.reloadData()
            }
        }
    }
    
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
        //BY putting the collectionVIEWCell you can load your CollectionView so you must say NewsCell.self
        newsFeedView.collectionView.register(NewsCell.self, forCellWithReuseIdentifier: "articleCell")
        fetchStories()
    }
    
    private func fetchStories(for section: String = "Technology") {
        NYTTopStoriesAPIClient.fetchTopStories(for: section) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error fetching stories: \(appError)")
            case .success(let article):
                //since you are making a strong reference cycle between 2 objects between to view controller is connected to the closure and they wont let go of each othe which will cause a memory leak so you make a WEAK refernce to self in order for them to break away.
                self?.newsArticles = article
            }
        }
    }
    
}
extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? NewsCell else {
            fatalError("could not downcast to NewsCell")
        }
        let article = newsArticles[indexPath.row]
        cell.configureCell(with: article)
        cell.backgroundColor = .white //use this to help you see the cells when there in the beginning after delete it 
        return cell
    }
    
    
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    //return item size
    //item size = 30% of the height of the device
    //item width = 100% of the device
    //this is where you make the size for the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //we capture this in a constant
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.2
        return CGSize(width: itemWidth, height: itemHeight)
    }
    //this will help segue to the next detailed view
    //since we are getting it from code this is a better way cause in prepare for segue we have to drag but we domt have that option
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = newsArticles[indexPath.row]
        let articleDVC = ArticleDetailViewController()//(article: article) when you r article becomes private it is better for encapsulation
        //TODO: we will be using initializers as dependency injection mechanisms
        //ins
        articleDVC.article = article
        //if you run the app click on the cell you will see the problem and nothing will happens because you did embed the navigation controller in the TABBAR. 
        navigationController?.pushViewController(articleDVC, animated: true)
    }
}
