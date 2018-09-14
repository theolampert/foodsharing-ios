//
//  BasketsViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 28.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

class BasketsViewController: UIViewController {
    let basketsView = BasketsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Baskets"
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.basketsView.name.value = "heello"
        }

    }
    
    override func loadView() {
        view = basketsView
    }
}
