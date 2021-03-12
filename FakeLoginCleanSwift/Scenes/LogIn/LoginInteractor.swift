//
//  LoginInteractor.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import Foundation

protocol LoginBusinessLogic: class {
    func loginUser(request: Login.Login.Request)
    
}

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic!

    func loginUser(request: Login.Login.Request) {
        let user = self.createUserBasedOnFields(request.fields)
        let response = Login.Login.Response(user: user)
        
        presenter.presentWelcomeMessage(response: response)        
    }
    
    private func createUserBasedOnFields(_ fields: Login.LoginFields) -> User {
        return User(username: fields.username, password: fields.password)
    }
}
