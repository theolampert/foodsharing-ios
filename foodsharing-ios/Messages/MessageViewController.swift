//
//  MessageViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 31.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//
import UIKit

class MessageViewController: UIViewController {
    let viewModel: MessageViewModel = MessageViewModel(webservice: FSWebService())
    let messageView: MessageView = MessageView()
    var id: String

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.id
        viewModel.delegate = self
        viewModel.getConversation(id: self.id)
    }
    
    override func loadView() {
        view = messageView
    }
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MessageViewController: MessageDelegate {
    func conversationDidChange() {
        self.messageView.renderMessages(messages: viewModel.messages)
    }
}
