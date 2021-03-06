//
//  Actions.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 02.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//
import ReSwift


func RequestConversations(state: State, store: Store<State>) -> Action? {
    FSWebService().getConversations() { conversations in
        store.dispatch(ReceiveConversations(conversations: conversations))
    }
    return nil
}

struct DisplayAlertMessage: Action {
    let alertMessage: String?
}

struct ReceiveConversations: Action {
    let conversations: [Conversation]
}

struct UpdateLoginForm: Action {
    let email: String?
    let password: String?
}

struct LoginUser: Action {
    let isLoggedIn: Bool
}

struct SetLoading: Action {
    let isLoading: Bool
}

func RequestUserLogin(state: State, store: Store<State>) -> Action? {
    let login = state.loginForm
    store.dispatch(SetLoading(isLoading: true))
    FSWebService().loginUser(email: login["email"]!, password: login["password"]!) { response, error in
        if error != nil {
            store.dispatch(DisplayAlertMessage(alertMessage: error!.message))
            store.dispatch(SetLoading(isLoading: false))
        }
        else {
            store.dispatch(LoginUser(isLoggedIn: true))
            store.dispatch(UpdateLoginForm(email: "", password: ""))
            store.dispatch(SetLoading(isLoading: false))
        }

    }
    return nil
}
