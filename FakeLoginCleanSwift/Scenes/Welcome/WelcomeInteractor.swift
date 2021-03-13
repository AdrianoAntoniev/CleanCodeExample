//
//  WelcomeInteractor.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//
import Foundation

protocol WelcomeBusinessLogic: class {
    func sayWelcome(request: Welcome.Welcome.Request)
}

protocol WelcomeDataStore {
    var user: User! { get set }
}

class WelcomeInteractor: WelcomeBusinessLogic, WelcomeDataStore {
    var user: User!
    
    var presenter: WelcomePresenter?
    
    func sayWelcome(request: Welcome.Welcome.Request) {
        // Como nao tenho nada pra fazer por enquanto com esse cara, simplesmente repasso para o response
        
        presenter?.presentMessage(response: Welcome.Welcome.Response(user: request.fields.username))
    }
}
