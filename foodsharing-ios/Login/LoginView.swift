//
//  View.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 25.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout

class LoginView: UIView {
    let rootFlexContainer = UIView()
    let submitButton = UIButton()
    let emailInput = UITextField()
    let passwordInput = UITextField()
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Style.white
        let iconImageView = UIImageView(image: UIImage(named: "Logo"))
        
        activityIndicator.frame = bounds
        activityIndicator.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        submitButton.backgroundColor = Style.apple
        submitButton.setTitle("Login", for: UIControl.State.normal)
        
        emailInput.placeholder = "Email"
        emailInput.backgroundColor = UIColor.white
        emailInput.keyboardType = UIKeyboardType.emailAddress
        emailInput.autocapitalizationType = UITextAutocapitalizationType.none
        
        passwordInput.placeholder = "Password"
        passwordInput.backgroundColor = UIColor.white
        passwordInput.isSecureTextEntry = true
        
        rootFlexContainer
            .flex
            .justifyContent(.center)
            .alignItems(.center)
            .padding(10)
            .define { (flex) in
                flex
                    .addItem(iconImageView)
                    .marginBottom(100)
                    .width(223)
                    .height(106.5)
                
                flex
                    .addItem(emailInput)
                    .padding(10)
                    .marginTop(10)
                    .width(100%)
                
                flex
                    .addItem(passwordInput)
                    .padding(10)
                    .marginTop(10)
                    .width(100%)
                
                flex
                    .addItem(submitButton)
                    .padding(10)
                    .marginTop(10)
                    .width(100%)
        }

        addSubview(rootFlexContainer)
        addSubview(activityIndicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        activityIndicator.pin.all(pin.safeArea)
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout()
    }
}
