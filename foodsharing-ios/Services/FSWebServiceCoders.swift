//
//  FSWebServiceCoders.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 02.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//
import Foundation

func decodeLoginResponse(withStatus status: Data) -> LoginStatus? {
    do {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(LoginStatus.self, from: status)
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
