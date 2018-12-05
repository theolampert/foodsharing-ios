//
//  MessageView.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 01.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

class MessageView: UIView {
    private var rootFlexContainer = UIScrollView()
    init() {
        super.init(frame: .zero)
        backgroundColor = Style.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
