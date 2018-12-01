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
        Alamofire.request(Constants.baseAPIUrl + "/conversations?limit=20")
            .responseJSON { response in
                if response.response?.statusCode == 401 {
                    print("NETWORK: Unauthorized")
                }
                else if response.result.isSuccess {
                    if let conversations = decodeCoversations(withConversations: response.data!) {
                        completion(conversations)
                    }
                }
            }
    }
    
    func getLoginStatus(completion: @escaping (LoginStatus) -> ()) {
        Alamofire.request(Constants.baseLegacyAPIUrl + "checklogin")
            .responseJSON { response in
                if response.response?.statusCode == 401 {
                    print("NETWORK: Request for login status failed")
                }
                else if response.result.isSuccess {
                    if let status = decodeLoginResponse(withStatus: response.data!) {
                        completion(status)
                    }
                }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (LoginSuccess?, LoginFailure?) -> ()) {
        let parameters: Parameters = [
            "email": email,
            "password": password,
            "remember_me": true
        ]
    
        Alamofire.request(Constants.baseAPIUrl + "/user/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                if response.response?.statusCode == 401 {
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
