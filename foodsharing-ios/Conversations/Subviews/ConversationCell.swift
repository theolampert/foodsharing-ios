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

    fileprivate let avatarImage = UIImageView(image: UIImage(named: "method"))
    fileprivate let nameLabel = UILabel()
    fileprivate let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        separatorInset = .zero

        struct imageDimensions {
            static let w = CGFloat(40)
            static let h = CGFloat(40)
        }
        
        let margin = CGFloat(10)
        
        addSubview(avatarImage)
        addSubview(nameLabel)
        addSubview(descriptionLabel)

        avatarImage.backgroundColor = UIColor(red:0.96, green:0.76, blue:0.32, alpha:1)
    
        avatarImage.frame = bounds
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.heightAnchor.constraint(equalToConstant: imageDimensions.h).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: imageDimensions.w).isActive = true
        avatarImage.leftAnchor.constraint(equalTo: leftAnchor, constant: margin).isActive = true
        avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: margin).isActive = true

        nameLabel.frame = bounds
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: margin).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: margin).isActive = true

        descriptionLabel.frame = bounds
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: margin).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: margin).isActive = true
        descriptionLabel.widthAnchor.constraint(
            equalTo: widthAnchor,
            constant: -(imageDimensions.w + (margin * 3))
        ).isActive = true

        heightAnchor.constraint(equalTo: descriptionLabel.heightAnchor, constant: (imageDimensions.h + margin)).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func truncateAtLineBreak(withString str: String) -> String {
        let lnbr: Character = "\n"
        if str.contains(lnbr) {
            return String(str.split(separator: lnbr)[0])
        }
        return str
    }
    
    func configure(conversation: Conversation) {
        if let name = conversation.name {
            nameLabel.text = name
            nameLabel.flex.markDirty()
        }
        else if !conversation.member.isEmpty {
            nameLabel.text = conversation.member[1].name
            avatarImage.downloaded(from: "https://beta.foodsharing.de/images/130_q_" + conversation.member[1].photo!)
            nameLabel.flex.markDirty()
        }
        if let preview = conversation.lastMessage {
            descriptionLabel.text = truncateAtLineBreak(withString: preview)
            descriptionLabel.flex.markDirty()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return contentView.frame.size
    }
}
