//
//  ConversationCell.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 31.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit


class ConversationCell: UITableViewCell {
    static let reuseIdentifier = "ConversationCell"
    fileprivate let padding: CGFloat = 10
    
    fileprivate let nameLabel = UILabel()
    fileprivate let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        separatorInset = .zero
        
        let iconImageView = UIImageView(image: UIImage(named: "method"))
        iconImageView.backgroundColor = UIColor(red:0.96, green:0.76, blue:0.32, alpha:1)
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.lineBreakMode = .byTruncatingTail
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
        
        contentView.flex.padding(12).define { (flex) in
            flex.addItem().direction(.row).define { (flex) in
                flex.addItem(iconImageView).size(30)
                flex.addItem(nameLabel).marginLeft(padding).grow(1)
            }
            
            flex.addItem(descriptionLabel).marginTop(padding)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func truncateAtLineBreak(withString str: String) -> String {
        return String(str.split(separator: "\n")[0])
    }
    
    func configure(conversation: Conversation) {
        if let name = conversation.name {
            nameLabel.text = name
            nameLabel.flex.markDirty()
        }
        else if !conversation.member.isEmpty {
            nameLabel.text = conversation.member[0].name
            nameLabel.flex.markDirty()
        }
        if let preview = conversation.lastMessage {
            descriptionLabel.text = truncateAtLineBreak(withString: preview)
            descriptionLabel.flex.markDirty()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    fileprivate func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        layout()
        return contentView.frame.size
    }
}
