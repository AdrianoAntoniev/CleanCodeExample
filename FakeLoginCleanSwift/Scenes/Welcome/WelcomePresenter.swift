//
//  WelcomePresenter.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import Foundation

protocol WelcomePresentationLogic {
    func presentMessage(response: Welcome.Welcome.Response)
}

class WelcomePresenter: WelcomePresentationLogic {
    var viewController: WelcomeDisplayLogic!
    
    func presentMessage(response: Welcome.Welcome.Response) {
        let viewModel = Welcome.Welcome.ViewModel(user: response.user.uppercased())
        
        viewController.displayWelcomeMessage(viewModel: viewModel)
    }        
}
