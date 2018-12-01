//
//  BasketsView.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 03.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout

class BasketsView: UIView {
    fileprivate let rootFlexContainer = UIView()

    init() {
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        rootFlexContainer.backgroundColor = .white
        rootFlexContainer
            .flex
            .justifyContent(.center)
            .alignItems(.center)
            .padding(10)
        
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
