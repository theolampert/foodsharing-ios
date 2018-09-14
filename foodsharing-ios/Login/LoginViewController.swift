//
//  ViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 25.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift
import ReSwift

let disposeBag = DisposeBag()

class LoginViewController: UIViewController, StoreSubscriber {
    private let loginView = LoginView()
    
    override func viewWillAppear(_ animated: Bool) {
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    
    func newState(state: State) {
        if state.alertMessage != "" {
            showAlert(message: state.alertMessage)
        }
        else if state.isLoggedIn {
            let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
            appDelegate.window?.rootViewController = MainViewController()
        }
        else if state.isLoading {
            loginView.activityIndicator.startAnimating()
        }
        
        else if !state.isLoading {
            loginView.activityIndicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        loginView.submitButton.rx.tap
            .map { RequestUserLogin }
            .subscribe(onNext: store.dispatch)
            .disposed(by: disposeBag)
        
        loginView.emailInput.rx.text.orEmpty.changed
            .map { UpdateLoginForm(email: $0, password: store.state.loginForm["email"]) }
            .subscribe(onNext: store.dispatch)
            .disposed(by: disposeBag)
        
        loginView.passwordInput.rx.text.orEmpty.changed
            .map { UpdateLoginForm(email: store.state.loginForm["email"], password: $0) }
            .subscribe(onNext: store.dispatch)
            .disposed(by: disposeBag)
        
        //MARK: Validations
        let emailValid = loginView.emailInput.rx.text.orEmpty
            .map { $0.count > 0 }
            .share(replay: 1)
        
        let passwordValid = loginView.passwordInput.rx.text.orEmpty
            .map { $0.count > 0 }
            .share(replay: 1)
        
        Observable.combineLatest(emailValid, passwordValid) { $0 && $1 }
            .bind(to: loginView.submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
    
    override func loadView() {
        view = loginView
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Login Failure", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            
        }))
        self.present(alert, animated: true, completion: nil)
        store.dispatch(DisplayAlertMessage(alertMessage: ""))
    }
}
