//
//  TopStoriesTabBARControllerViewController.swift
//  TOPStoriesAssestmentReview
//
//  Created by Melinda Diaz on 2/6/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class TopStoriesTabBARControllerViewController: UITabBarController {

    
    private lazy var newsFeedVC: NewsFeedViewController = {
        let viewController = NewsFeedViewController()
        viewController.tabBarItem = UITabBarItem(title: "news Feed", image: UIImage(systemName: "eyeglasses"), tag: 0)
        return viewController
    }()
    
    private lazy var savedArticleVC: SavedArticleViewController = {
        let viewController = SavedArticleViewController()
        viewController.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "folder"), tag: 1)
        return viewController
    }()
    
    private lazy var settingsVC: SettingsViewController = {
        let viewController = SettingsViewController()
        viewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
viewControllers = [newsFeedVC, savedArticleVC, settingsVC]
    }
}
