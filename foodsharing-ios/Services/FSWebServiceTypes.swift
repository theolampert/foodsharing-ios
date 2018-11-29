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
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case geschlecht
        case name
        case photo
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

struct Conversation: Codable {
    let id: String
    let last: String
    let lastFoodsaverID: String
    let lastMessage: String?
    let lastTS: String
    let unread: String
    let name: String?
    
    var member: [Member]
    
    enum CodingKeys: String, CodingKey {
        case id
        case last
        case lastFoodsaverID = "last_foodsaver_id"
        case lastMessage = "last_message"
        case lastTS = "last_ts"
        case unread
        case member
        case name
    }
    
    /* MARK: Work around for backend bug needs a custom initialiser,
     * see: https://gitlab.com/foodsharing-dev/foodsharing/merge_requests/592
     */
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.last = try container.decode(String.self, forKey: .last)
        self.lastFoodsaverID = try container.decode(String.self, forKey: .lastFoodsaverID)
        self.lastMessage = try container.decodeIfPresent(String.self, forKey: .lastMessage)
        self.lastTS = try container.decode(String.self, forKey: .lastTS)
        self.unread = try container.decode(String.self, forKey: .unread)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        
        do {
            self.member = try container.decode([Member].self, forKey: .member)
        } catch DecodingError.typeMismatch {
            self.member = []
        }

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

struct LoginStatus: Codable {
    let status: Bool
    
    //MARK: Custom initialiser for cleaning up response
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            let number = try container.decode(Int.self, forKey: .status)
            if (number == 1) {
                self.status = true
            } else {
                self.status = false
            }
        } catch DecodingError.typeMismatch {
            self.status = false
        }
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
