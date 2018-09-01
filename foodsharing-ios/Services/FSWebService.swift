//
//  LoginModel.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 27.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//
import Foundation
import Alamofire

struct Member: Decodable {
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

struct MemberShort: Decodable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

struct Conversation: Decodable {
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

struct Message: Decodable {
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

struct ConversationDetail: Decodable {
    let member: [MemberShort]
    let messages: [Message]
    
    enum CodingKeys: String, CodingKey {
        case member
        case messages
    }
}

class FSWebService {
    func getConversation(conversationID: String, completion: @escaping (ConversationDetail) -> ()) {
        Alamofire.request(Constants.baseAPIUrl + "/conversations/" + conversationID)
            .responseJSON { response in
                if response.result.isSuccess {
                    let jsonData = response.data
                    let jsonDecoder = JSONDecoder()
                    do {
                        let conversation = try jsonDecoder.decode(ConversationDetail.self, from: jsonData!)
                        completion(conversation)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
        }
    }
    
    func getConversations(completion: @escaping ([Conversation]) -> ()) {
        Alamofire.request(Constants.baseAPIUrl + "/conversations")
            .responseJSON { response in
                if response.result.isSuccess {
                    let jsonData = response.data
                    let jsonDecoder = JSONDecoder()
                    do {
                        let conversations = try jsonDecoder.decode([Conversation].self, from: jsonData!)
                        completion(conversations)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Any) -> ()) {
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]
    
        Alamofire.request(Constants.baseAPIUrl + "/user/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
            if response.result.isSuccess {
                let cookie = HTTPCookieStorage.shared.cookies!.first
                UserDefaults.standard.set(cookie!.properties, forKey: Constants.sessionCookie)
                completion(response)
            }
        }
    
    }
}
