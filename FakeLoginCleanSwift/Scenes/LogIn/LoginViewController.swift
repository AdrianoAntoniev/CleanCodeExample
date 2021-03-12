//
//  LoginViewController.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import UIKit

protocol LoginDisplayLogic: class {
    // aqui tenho que receber um view model, e mostrar o mesmo (no caso, passar para frente)
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic!
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = userTextField.text!
        let password = passwordTextField.text!
                
        // Aqui eu nao crio um objeto do tipo User, mas uma requisicao com o objeto!
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
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel) {
        //print("O usuario \(viewModel.user!.username) de senha \(viewModel.user!.password) logou!")
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
