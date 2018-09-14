//
//  Store.swift
//  foodsharing-ios
//
//  Created by Theo Lampert on 02.09.18.
//  Copyright © 2018 Theo Lampert. All rights reserved.
//

import ReSwift

struct State: StateType {
    var conversations: [Conversation] = []
    var loginForm: [String:String] = [
        "email": "",
        "password": ""
    ]
    var isLoggedIn: Bool = false
    var isLoading: Bool = false
    var alertMessage: String = ""
}

let loggingMiddleware: Middleware<Any> = { dispatch, getState in
    return { next in
        return { action in
            print("DISPATCHED:", type(of: action))
            print("STATE:", getState()!)
            return next(action)
        }
    }
}

let store = Store(
    reducer: rootReducer,
    state: State(),
    middleware: [loggingMiddleware]
)
