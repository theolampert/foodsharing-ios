//
//  MessageViewController.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 28.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit
import ReSwift


class ConversationViewController: UIViewController, StoreSubscriber {
    private var conversationView: ConversationView = ConversationView()
    
    override func viewWillAppear(_ animated: Bool) {
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    
    func newState(state: State) {
        conversationView.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversationView.tableView.register(ConversationCell.self, forCellReuseIdentifier: ConversationCell.reuseIdentifier)
        conversationView.tableView.dataSource = self
        conversationView.tableView.delegate = self
        store.dispatch(RequestConversations)
    }
    
    override func loadView() {
        title = "Conversations"
        view = conversationView
    }
}

extension ConversationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = store.state.conversations[indexPath.row].id
        navigationController?.pushViewController(MessageViewController(id: id), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.state.conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversationCell.reuseIdentifier, for: indexPath) as! ConversationCell
        cell.configure(conversation: store.state.conversations[indexPath.row])
        
        return cell
    }
}


