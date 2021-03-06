//
//  View.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 25.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

class LoginView: UIView {
    let rootFlexContainer = UIView()
    let submitButton = UIButton()
    let emailInput = UITextField()
    let passwordInput = UITextField()
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    let iconImageView = UIImageView(image: UIImage(named: "Logo"))
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Style.white
        
        addSubview(activityIndicator)
        addSubview(iconImageView)
        addSubview(emailInput)
        addSubview(passwordInput)
        addSubview(submitButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupLayout() {
        // Constants
        struct imageDimensions {
            static let w = CGFloat(223)
            static let h = CGFloat(106.5)
        }
        let inputHeight = CGFloat(40)
        let margin = CGFloat(10)

        // Activity
        activityIndicator.frame = bounds
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        activityIndicator.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        activityIndicator.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.04705882353)
        activityIndicator.layer.zPosition = 1
        
        // Logo
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.heightAnchor.constraint(equalToConstant: imageDimensions.h).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: imageDimensions.w).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -imageDimensions.h).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        // Email Field
        emailInput.placeholder = "Email"
        emailInput.backgroundColor = UIColor.white
        emailInput.keyboardType = UIKeyboardType.emailAddress
        emailInput.autocapitalizationType = UITextAutocapitalizationType.none
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        emailInput.leftAnchor.constraint(equalTo: leftAnchor, constant: margin).isActive = true
        emailInput.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin).isActive = true
        emailInput.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: margin).isActive = true
        emailInput.heightAnchor.constraint(equalToConstant: inputHeight).isActive = true
        
        // Password Field
        passwordInput.placeholder = "Password"
        passwordInput.backgroundColor = UIColor.white
        passwordInput.isSecureTextEntry = true
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.leftAnchor.constraint(equalTo: leftAnchor, constant: margin).isActive = true
        passwordInput.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin).isActive = true
        passwordInput.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: margin).isActive = true
        passwordInput.heightAnchor.constraint(equalToConstant: inputHeight).isActive = true
        
        // Submit Button
        submitButton.backgroundColor = Style.apple
        submitButton.setTitle("Login", for: UIControl.State.normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.leftAnchor.constraint(equalTo: leftAnchor, constant: margin).isActive = true
        submitButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin).isActive = true
        submitButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: margin).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: inputHeight).isActive = true
    }
    
    override func layoutSubviews() {
        self.setupLayout()
        super.layoutSubviews()
    }
}
