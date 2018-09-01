//
//  ViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 25.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    private let viewModel: LoginViewModel = LoginViewModel(webservice: FSWebService())
    private let loginView = LoginView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configureView()
    }
    
    func configureView() {
        //MARK: Bind inputs
        loginView.submitButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        loginView.emailInput.addTarget(self, action: #selector(self.updateEmail), for: .touchUpInside)
        loginView.passwordInput.addTarget(self, action: #selector(self.updatePassword), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        viewModel.loginUser()
    }
    
    override func loadView() {
        view = loginView
    }
}

extension LoginViewController: LoginDelegate {
    func loadingDidChange() {
    }

    func loggedInDidChange() {
        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        appDelegate.window?.rootViewController = MainViewController()
    }
}

extension LoginViewController: UITextFieldDelegate {
    @objc func updateEmail(_ textField: UITextField) {
        viewModel.email = textField.text!
    }

    @objc func updatePassword(_ textField: UITextField) {
        viewModel.password = textField.text!
    }
}
