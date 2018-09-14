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
        if let cachedConversation = UserDefaults.standard.object(forKey: "message-" + id) {
            do {
                let jsonDecoder = JSONDecoder()
                let e = try jsonDecoder.decode(ConversationDetail.self, from: cachedConversation as! Data)
                self.messages = e.messages
            } catch let error {
                print(error.localizedDescription)
            }
        }
        webservice.getConversation(conversationID: id) { conversation in
            self.messages = conversation.messages
            do {
                let jsonEncoder = JSONEncoder()
                let e = try jsonEncoder.encode(conversation)
                UserDefaults.standard.set(e, forKey: "message-" + id)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    init(webservice: FSWebService) {
        self.webservice = webservice
    }
}
