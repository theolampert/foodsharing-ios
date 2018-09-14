//
//  Reducers.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 02.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import ReSwift

func conversationReducer(action: Action, state: [Conversation]?) -> [Conversation] {
    var state = state ?? []
    
    switch action {
    case let receiveConversations as ReceiveConversations:
        state = receiveConversations.conversations
    default:
        break
    }
    
    return state
}

func loginFormReducer(action: Action, state: [String: String]?) -> [String: String] {
    var state = state ?? ["email": "", "password": ""]
    
    switch action {
    case let updateLoginForm as UpdateLoginForm:
        state["email"] = updateLoginForm.email ?? state["email"]
        state["password"] = updateLoginForm.password ?? state["password"]
    default:
        break
    }
    
    return state
}

func isLoggedInReducer(action: Action, state: Bool?) -> Bool {
    var state = state ?? false

    switch action {
    case let loginUser as LoginUser:
        state = loginUser.isLoggedIn
    default:
        break
    }
    
    return state
}

func isLoadingReducer(action: Action, state: Bool?) -> Bool {
    var state = state ?? false
    
    switch action {
    case let setLoading as SetLoading:
        state = setLoading.isLoading
    default:
        break
    }
    
    return state
}

func alertMessageReducer(action: Action, state: String?) -> String {
    var state = state ?? ""
    
    switch action {
    case let displayAlertMessage as DisplayAlertMessage:
        state = displayAlertMessage.alertMessage!
    default:
        break
    }
    
    return state
}

func rootReducer(action: Action, state: State?) -> State {
    return State(
        conversations: conversationReducer(action: action, state: state?.conversations),
        loginForm: loginFormReducer(action: action, state: state?.loginForm),
        isLoggedIn: isLoggedInReducer(action: action, state: state?.isLoggedIn),
        isLoading: isLoadingReducer(action: action, state: state?.isLoading),
        alertMessage: alertMessageReducer(action: action, state: state?.alertMessage)
    )
}
