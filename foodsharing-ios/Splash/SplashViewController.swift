//
//  SplashViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 27.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    private let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!

    func loadSessionCookie() -> Bool {
        if let cookieVal = UserDefaults.standard.object(forKey: Constants.sessionCookie) as? [HTTPCookiePropertyKey: Any] {
            let cookie = HTTPCookie(properties: cookieVal)
            HTTPCookieStorage.shared.setCookie(cookie!)
            return true
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = Style.brownBramble

        let hasSession = loadSessionCookie()
        if hasSession {
            verifySession()
        } else {
            // navigate to login screen
            self.activityIndicator.stopAnimating()
            appDelegate.window?.rootViewController = LoginViewController()
        }
    }

    private func verifySession() {
        activityIndicator.startAnimating()

        //MARK: This should actually verify that the session is valid
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(0)) {
            self.activityIndicator.stopAnimating()
            if false {
                // navigate to protected page
                self.appDelegate.window?.rootViewController = MainViewController()
            } else {
                // navigate to login screen
                self.appDelegate.window?.rootViewController = LoginViewController()
            }
        }
    }

}
