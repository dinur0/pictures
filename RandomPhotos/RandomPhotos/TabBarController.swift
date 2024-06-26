//
//  TabBarController.swift
//  RandomPhotos
//
//  Created by хех on 25.06.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        self.tabBar.barTintColor = .gray
        self.tabBar.tintColor = .red

        // Do any additional setup after loading the view.
    }
    
    private func setupTabs () {
        let picturesButton = self.createNav(with: "Pictures", and: UIImage(systemName: "photo.circle"), ve: PicturesView())
        let infoButton = self.createNav(with: "Info", and: UIImage(systemName: "info.circle.fill"), ve: FavoritesView())
        self.setViewControllers([picturesButton,infoButton], animated: true)
    }
    
    private func createNav (with title: String, and image: UIImage?, ve:
                            UIViewController) -> UINavigationController {
        let nav = UINavigationController (rootViewController: ve)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }
}
