//
//  WelcomeViewController.swift
//  FakeLoginCleanSwift
//
//  Created by Adriano Rodrigues Vieira on 11/03/21.
//

import UIKit

protocol WelcomeDisplayLogic {
    func displayWelcomeMessage(viewModel: Welcome.Welcome.ViewModel)
}

class WelcomeViewController: UIViewController, WelcomeDisplayLogic {
    @IBOutlet weak var userNameLabel: UILabel!    
    
    var interactor: WelcomeInteractor!
    var router: (NSObject & WelcomeRoutingLogic & ShowWelcomeUserDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = router?.dataStore?.user {
            let request = Welcome.Welcome.Request(fields: Welcome.WelcomeFields(username: user.username, password: user.password))
            interactor.sayWelcome(request: request)
        } else {
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {        
        let viewController = self
        viewController.interactor = WelcomeInteractor()
        
        let router = WelcomeRouter()
        viewController.router = router
        router.dataStore = interactor
        
        let presenter = WelcomePresenter()
        presenter.viewController = viewController
        interactor.presenter = presenter
    }
    
    func displayWelcomeMessage(viewModel: Welcome.Welcome.ViewModel) {        
        userNameLabel.text = viewModel.user        
    }
}
