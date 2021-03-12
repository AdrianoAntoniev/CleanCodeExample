//
//  LoginModel.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import Foundation

enum Login {
    struct LoginFields {
        var username: String
        var password: String
    }
    
    enum Login {
        struct Request {
            var fields: LoginFields
        }
        
        struct Response {
            var user: User?
        }
        
        struct ViewModel {
            var user: User?
        }
    }
}
