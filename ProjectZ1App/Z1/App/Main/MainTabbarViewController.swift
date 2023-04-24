//
//  MainTabbarViewController.swift
//  Z1 App Clone
//
//  Created by MacBook Pro on 24/3/23.
//

import UIKit

class MainTabbarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomAppBar()
    }
    
    func bottomAppBar() {
        // Initialize home
        guard let homeViewController = UIStoryboard(name: "HomeViewController", bundle: .main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }

        // Initialize home
        guard let favoritesViewController = UIStoryboard(name: "FavoritesViewController", bundle: .main).instantiateViewController(withIdentifier: "FavoritesViewController") as? FavoritesViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }
        
        // Initialize home
        guard let scanViewController = UIStoryboard(name: "ScanViewController", bundle: .main).instantiateViewController(withIdentifier: "ScanViewController") as? ScanViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }
        
        // Initialize home
        guard let zpoinViewController = UIStoryboard(name: "ZpoinViewController", bundle: .main).instantiateViewController(withIdentifier: "ZpoinViewController") as? ZpoinViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }
        
        // Initialize home
        guard let meViewController = UIStoryboard(name: "MeViewController", bundle: .main).instantiateViewController(withIdentifier: "MeViewController") as? MeViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }
     
        let homeController1 = UINavigationController(rootViewController: homeViewController)
        let favorithsController2 = UINavigationController(rootViewController: favoritesViewController)
        let scanController3 = UINavigationController(rootViewController: scanViewController)
        let zpoinController4 = UINavigationController(rootViewController: zpoinViewController)
        let meController5 = UINavigationController(rootViewController: meViewController)
        
        homeController1.tabBarItem.image = UIImage(named: "HomeApp")
        favorithsController2.tabBarItem.image = UIImage(named: "FavorithApp")
        scanController3.tabBarItem.image = UIImage(named: "ScanApp")
        zpoinController4.tabBarItem.image = UIImage(named: "ZpoinApp")
        meController5.tabBarItem.image = UIImage(named: "ProfileApp")
        homeController1.tabBarItem.selectedImage = UIImage(named: "HomeAppActive")?.withRenderingMode(.alwaysOriginal)
        favorithsController2.tabBarItem.selectedImage = UIImage(named: "FavorithAppActive")?.withRenderingMode(.alwaysOriginal)
        scanController3.tabBarItem.selectedImage = UIImage(named: "ScanAppActive")?.withRenderingMode(.alwaysOriginal)
        zpoinController4.tabBarItem.selectedImage = UIImage(named: "ZpoinAppActive")?.withRenderingMode(.alwaysOriginal)
        meController5.tabBarItem.selectedImage = UIImage(named: "ProfileAppActive")?.withRenderingMode(.alwaysOriginal)
        
        homeController1.title = "Home"
        favorithsController2.title = "Favorites"
        scanController3.title = "Scan"
        zpoinController4.title = "ZPOIN"
        meController5.title = "Me"
        
        gradientBottomAppBar()
        
        setViewControllers([homeController1, favorithsController2, scanController3, zpoinController4, meController5], animated: true)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
    }
    
    func gradientBottomAppBar() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowRadius = 2.5
        tabBar.backgroundColor = .white
    }
}
