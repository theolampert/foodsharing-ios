//
//  MessageViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 28.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit


class ConversationViewController: UIViewController {
    private var viewModel: ConversationViewModel = ConversationViewModel(webservice: FSWebService())
    private var conversationView: ConversationView = ConversationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Conversations"

        conversationView.tableView.register(ConversationCell.self, forCellReuseIdentifier: ConversationCell.reuseIdentifier)
        conversationView.tableView.dataSource = self
        conversationView.tableView.delegate = self

        viewModel.delegate = self
        viewModel.getConversations()
    }
    
    override func loadView() {
        self.title = "Conversations"
        view = conversationView
    }
}

extension ConversationViewController: ConversationsDelegate {
    func conversationsDidChange() {
        self.conversationView.layoutConversations(conversations: viewModel.conversations)
    }

    func messageViewPushed() {
        self.navigationController?.pushViewController(MessageViewController(id: viewModel.messageView), animated: true)
    }
}

extension ConversationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.pushMessageView(id: self.viewModel.conversations[indexPath.row].id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversationCell.reuseIdentifier, for: indexPath) as! ConversationCell
        cell.configure(conversation: self.viewModel.conversations[indexPath.row])
        
        return cell
    }
}


