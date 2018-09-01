//
//  MessageViewModel.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 31.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//
import UIKit

protocol MessageDelegate {
    func conversationDidChange()
}

protocol MessageViewModelType {
    var messages: [Message] { get }
    var member: [MemberShort] { get }
    var delegate: MessageDelegate? { get set }
}

class MessageViewModel: MessageViewModelType {
    private(set) var webservice: FSWebService!
    var delegate: MessageDelegate?
    
    var messages: [Message] = [] {
        didSet {
            delegate?.conversationDidChange()
        }
    }
    
    var member: [MemberShort] = [] {
        didSet {
            delegate?.conversationDidChange()
        }
    }
    
    func getConversation(id: String) {
        webservice.getConversation(conversationID: id) { conversation in
            self.messages = conversation.messages
//            self.member = conversation.member
            
        }
    }
    
    init(webservice: FSWebService) {
        self.webservice = webservice
    }
}
