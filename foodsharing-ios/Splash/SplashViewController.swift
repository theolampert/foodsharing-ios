//
//  SplashViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 27.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    private let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = Style.brownBramble
        verifySession()
    }

    private func verifySession() {
        activityIndicator.startAnimating()
        FSWebService().getLoginStatus() { response in
            if response.status {
                self.appDelegate.window?.rootViewController = MainViewController()
            }
            else {
                self.appDelegate.window?.rootViewController = LoginViewController()
            }
            self.activityIndicator.stopAnimating()
        }
    }

}
