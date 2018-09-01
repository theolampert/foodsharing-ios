//
//  ConversationView.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 27.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

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


class ConversationView: UIView {
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    let tableView = UITableView()
    private var conversations: [Conversation] = []

    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureView() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    func layoutConversations (conversations: [Conversation]) {
        activityIndicator.stopAnimating()
        self.conversations = conversations
        tableView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicator.startAnimating()
        
        tableView.pin.all()
        activityIndicator.pin.all()
    }
}
