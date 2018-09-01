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
    fileprivate let rootFlexContainer = UIView()
    let submitButton = UIButton()
    let emailInput = UITextField()
    let passwordInput = UITextField()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Style.scotchMist
        
        let iconImageView = UIImageView(image: UIImage(named: "Logo"))
        
        submitButton.backgroundColor = Style.brownBramble
        submitButton.setTitle("Login", for: UIControlState.normal)
        
        emailInput.placeholder = "your@email.com"
        emailInput.backgroundColor = UIColor.white
        emailInput.keyboardType = UIKeyboardType.emailAddress
        emailInput.autocapitalizationType = UITextAutocapitalizationType.none
        
        passwordInput.placeholder = "**********"
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout()
    }
}
