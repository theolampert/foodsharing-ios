//
//  FSWebServiceCoders.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 02.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//
import Foundation


func encodeCoversations(withConversations conversations: [Conversation]) -> Data? {
    do {
        let jsonEncoder = JSONEncoder()
        return try jsonEncoder.encode(conversations)
    } catch let error {
        print(error.localizedDescription)
    }
    return nil
}

func decodeCoversations(withConversations conversations: Data) -> [Conversation]? {
    do {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode([Conversation].self, from: conversations)
    } catch let error {
        print(error.localizedDescription)
    }
    return nil
}
