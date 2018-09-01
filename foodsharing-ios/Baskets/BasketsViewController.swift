//
//  BasketsViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 28.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

class BasketsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Baskets"
    }
    
    override func loadView() {
        let label = UILabel()
        label.text = "baskets"
        view = label
    }
}
