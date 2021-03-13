//
//  LoginViewController.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import UIKit

protocol LoginDisplayLogic: class {
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic!
    var router: (NSObjectProtocol & LoginRoutingLogic & ShowUserDataPassing)?
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = userTextField.text!
        let password = passwordTextField.text!
                        
        let request = Login.Login.Request(fields: Login.LoginFields(username: username, password: password))
        
        interactor.loginUser(request: request)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
        
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
                
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel) {
        // como o user foi salvo via dataStore, nao eh preciso pegar o user via view model.
        // uma medida alternativa seria pegar o user do view model e passar ele via router dessa forma:
        // router?.routeToWelcome(viewModel: viewModel)
        // e no router passar a informacao direto na label.
        router?.routeToWelcome()
    }    
}
