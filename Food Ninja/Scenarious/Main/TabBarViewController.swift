//
//  TabBarViewController.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 08/09/22.
//

import UIKit

public class TabBarViewController: UITabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
}

extension TabBarViewController {
    private func initViews() {
        let homeController = HomeViewController()
        homeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), selectedImage: UIImage(named: "homeSel")?.withRenderingMode(.alwaysOriginal))
        let profileController = ProfileViewController()
        profileController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), selectedImage: UIImage(named: "profileSel")?.withRenderingMode(.alwaysOriginal))
        let cartController = CartViewController()
        cartController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "cart")?.withTintColor(.white, renderingMode: .alwaysOriginal), selectedImage: UIImage(named: "cartSel")?.withRenderingMode(.alwaysOriginal))
        let orderController = OrderViewController()
        orderController.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "order")?.withTintColor(.white, renderingMode: .alwaysOriginal), selectedImage: UIImage(named: "orderSel")?.withRenderingMode(.alwaysOriginal))
        tabBar.backgroundColor = .black
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 10
        tabBar.clipsToBounds = true
        tabBar.tintColor = .greenColor
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewControllers = [homeController, profileController, cartController, orderController]
    }
}
