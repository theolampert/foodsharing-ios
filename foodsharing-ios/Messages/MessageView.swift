//
//  MessageView.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 01.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout


class MessageView: UIView {
    private var rootFlexContainer = UIScrollView()
    init() {
        super.init(frame: .zero)
        backgroundColor = Style.white
    }

    func createMessagesView(withMessages messages: [Message]) -> UIScrollView {
        let rootFlexContainer = UIScrollView()
        rootFlexContainer.backgroundColor = Style.white
        rootFlexContainer
            .flex
            .justifyContent(.start)
            .alignItems(.start)
            .padding(10)
            .height(100%)
            .width(100%)
        
        func makeLabel(message: Message) -> UIView {
            let messageContainer = UIView()
            let name = UILabel()
            let body = UILabel()
            
            name.text = message.fsName
            name.numberOfLines = 0
            
            body.text = message.body
            body.numberOfLines = 0
            
            messageContainer.backgroundColor = Style.scotchMist
            messageContainer
                .flex
                .padding(15)
                .marginTop(10)
                .width(100%)
                .marginBottom(10)
                .define { (flex) in
                    flex.addItem(name)
                    flex.addItem(body)
                }
            
            return messageContainer
        }
        
        func appendToRoot(_ bubble: UIView) {
            rootFlexContainer
                .flex
                .define { (flex) in
                    flex
                        .addItem(bubble)
            }
        }
        
        let messageBubbles = messages.map(makeLabel)
        messageBubbles.forEach(appendToRoot)
        
        return rootFlexContainer
    }
    
    // MARK: Throwing away and recreating the whole view on state change
    // (eg. react) is probably not great for performance
    func renderMessages(messages: [Message]) {
        rootFlexContainer.removeFromSuperview()
        rootFlexContainer = createMessagesView(withMessages: messages)
        
        addSubview(rootFlexContainer)
        layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout()
    }
}
