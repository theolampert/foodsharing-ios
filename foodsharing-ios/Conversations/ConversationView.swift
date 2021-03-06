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

class ConversationView: UIView {
    private let activityIndicator = UIActivityIndicatorView(style: .gray)
    let tableView = UITableView()

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
        
        tableView.frame = bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    func layoutConversations (conversations: [Conversation]) {
        tableView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
