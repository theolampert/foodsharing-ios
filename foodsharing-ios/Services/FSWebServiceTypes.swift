//
//  FSWebServiceTypes.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 02.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//


struct Member: Decodable, Encodable {
    let id: String
    let email: String
    let geschlecht: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case geschlecht
        case name
    }
}

struct MemberShort: Decodable, Encodable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

struct Conversation: Decodable, Encodable {
    let id: String
    let last: String
    let lastFoodsaverID: String
    let lastMessage: String
    let lastTS: String
    let unread: String
    let member: [Member]
    
    enum CodingKeys: String, CodingKey {
        case id
        case last
        case lastFoodsaverID = "last_foodsaver_id"
        case lastMessage = "last_message"
        case lastTS = "last_ts"
        case unread
        case member
    }
}

struct Message: Decodable, Encodable {
    let id: String
    let fsID: String
    let fsName: String
    let body: String
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case fsID = "fs_id"
        case fsName = "fs_name"
        case body
        case time
    }
}

struct ConversationDetail: Decodable, Encodable {
    let member: [MemberShort]
    let messages: [Message]
    
    enum CodingKeys: String, CodingKey {
        case member
        case messages
    }
}

struct LoginSuccess: Decodable, Encodable {
    let id: Int
    let name: String
}

struct LoginFailure: Decodable, Encodable {
    let code: Int
    let message: String
}
