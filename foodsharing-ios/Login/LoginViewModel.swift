//
//  LoginViewModel.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 29.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

protocol LoginDelegate {
    func loadingDidChange()
    func loggedInDidChange()
}

protocol LoginViewModelType {
    var email: String { get set }
    var password: String { get set }
    var loading: Bool { get }
    var loggedIn: Bool { get }
    var delegate: LoginDelegate? { get set }
}

class LoginViewModel: LoginViewModelType {
    private(set) var webservice: FSWebService!
    var delegate: LoginDelegate?
    
    var email: String
    var password: String

    var loading: Bool = false {
        didSet{
            print("Loading:", self.loading)
            delegate?.loadingDidChange()
        }
    }
    
    var loggedIn: Bool = false {
        didSet{
            print("Logged In:", self.loading)
            delegate?.loggedInDidChange()
        }
    }
    
    func loginUser() {
        loading = true
        webservice.loginUser(email: self.email, password: self.password) { data in
            self.loggedIn = true
            self.loading = false
        }
    }
    
    init(webservice: FSWebService) {
        self.webservice = webservice
        // MARK: remove
        email = "userbot@example.com"
        password = "user"
    }
}
