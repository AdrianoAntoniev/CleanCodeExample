//
//  LoginPresenter.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import Foundation

protocol LoginPresentationLogic: class {
    func presentWelcomeMessage(response: Login.Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentWelcomeMessage(response: Login.Login.Response) {
        let user = User(username: response.user!.username, password: response.user!.password)
        
        let viewModel = Login.Login.ViewModel(user: user)
        viewController?.displayLoginSuccessful(viewModel: viewModel)
    }    
}
