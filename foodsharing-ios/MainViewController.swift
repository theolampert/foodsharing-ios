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
        let conversationTab = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        conversationViewContoller.tabBarItem = conversationTab
        
        let basketsViewController = UINavigationController(rootViewController: BasketsViewController())
        basketsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [conversationViewContoller, basketsViewController]
        viewControllers = tabBarList
    }
}

