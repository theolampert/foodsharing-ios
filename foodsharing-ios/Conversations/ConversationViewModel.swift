//
//  MessageViewModel.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 29.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//
import UIKit


protocol ConversationsDelegate {
    func messageViewPushed()
}

protocol ConversationViewModelType {
    var messageView: String { get set }
    var delegate: ConversationsDelegate? { get set }
}


class ConversationViewModel: ConversationViewModelType {
    private(set) var webservice: FSWebService!
    var delegate: ConversationsDelegate?

    var messageView: String = "" {
        didSet {
            delegate?.messageViewPushed()
        }
    }
    
    func pushMessageView(id: String) {
        self.messageView = id
    }
    
    init(webservice: FSWebService) {
        self.webservice = webservice
    }
}
