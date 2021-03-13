//
//  WelcomeRouter.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import Foundation

protocol WelcomeRoutingLogic {
    
}

protocol ShowWelcomeUserDataPassing {
    var dataStore: WelcomeDataStore? { get }
}

class WelcomeRouter: NSObject, WelcomeRoutingLogic, ShowWelcomeUserDataPassing {
    var dataStore: WelcomeDataStore?    
    var viewController: WelcomeDisplayLogic?        
}

