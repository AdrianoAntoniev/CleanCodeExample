//
//  LoginRouter.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import Foundation
import UIKit

protocol ShowUserDataPassing {
    var dataStore: UserDataStore? { get }
}


protocol LoginRoutingLogic {
    func routeToWelcome()
}

class LoginRouter: NSObject, ShowUserDataPassing, LoginRoutingLogic {
    var dataStore: UserDataStore?
    var viewController: LoginViewController?
    
    func routeToWelcome() {
        if let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController {
            var destinationDS = destinationVC.router!.dataStore!
        
            passDataFromLoginToWelcomeScreen(source: dataStore!, destination: &destinationDS)
            viewController?.navigationController?.pushViewController(destinationVC, animated: true)
            
        }
    }
    
    private func passDataFromLoginToWelcomeScreen(source: UserDataStore, destination: inout WelcomeDataStore) {
        destination.user = source.user
    }
}
