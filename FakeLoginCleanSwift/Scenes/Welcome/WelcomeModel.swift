//
//  WelcomeModel.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import Foundation

enum Welcome {
    struct WelcomeFields {
        var username: String
        var password: String
    }
    
    enum Welcome {
        struct Request {
            var fields: WelcomeFields
        }
        
        struct Response {
            var user: String
        }
        
        struct ViewModel {
            var user: String
        }
    }
}
