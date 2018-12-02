//
//  MessageViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 27.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let conversationViewContoller = UINavigationController(rootViewController: ConversationViewController())
        let conversationTab = UITabBarItem()
        conversationTab.image = UIImage(named: "Chat")
        conversationViewContoller.tabBarItem = conversationTab
        
        let basketsViewController = UINavigationController(rootViewController: BasketsViewController())
        let basketsTab = UITabBarItem()
        basketsTab.image = UIImage(named: "Basket")
        basketsViewController.tabBarItem = basketsTab
        
        let tabBarList = [conversationViewContoller, basketsViewController]
        viewControllers = tabBarList
    }
}

