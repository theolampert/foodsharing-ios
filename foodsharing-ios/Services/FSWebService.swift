//
//  LoginModel.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 27.08.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.

import Alamofire

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
                if response.response?.statusCode == 401 {
                    print("NETWORK: Unauthorized")
                }
                else if response.result.isSuccess {
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
    
    func loginUser(email: String, password: String, completion: @escaping (LoginSuccess?, LoginFailure?) -> ()) {
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]
    
        Alamofire.request(Constants.baseAPIUrl + "/user/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                if response.response?.statusCode == 401 {
                    let cookie = HTTPCookieStorage.shared.cookies!.first
                    UserDefaults.standard.set(cookie!.properties, forKey: Constants.sessionCookie)
                    let jsonData = response.data
                    let jsonDecoder = JSONDecoder()
                    do {
                        let loginFailure = try jsonDecoder.decode(LoginFailure.self, from: jsonData!)
                        completion(nil, loginFailure)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
                else if response.result.isSuccess {
                    let cookie = HTTPCookieStorage.shared.cookies!.first
                    UserDefaults.standard.set(cookie!.properties, forKey: Constants.sessionCookie)
                    let jsonData = response.data
                    let jsonDecoder = JSONDecoder()
                    do {
                        let loginSuccess = try jsonDecoder.decode(LoginSuccess.self, from: jsonData!)
                        completion(loginSuccess, nil)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
        }
    
    }
}
