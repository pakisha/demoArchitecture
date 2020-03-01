//
//  AuthViewControllerFactoryImp.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: AuthViewControllerFactory {
    
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginRegisterViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "ChooseLoginRegisterViewController") as! ChooseLoginRegisterViewController
        viewController.viewModel = ChooseLoginRegisterViewModel()
        return viewController
    }
    
    func instantiateLoginViewController() -> LoginViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        viewController.viewModel = LoginViewModel(authServices: self.authServices)
        return viewController
    }
    
    func instantiateRegisterViewController() -> RegisterViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        viewController.viewModel = RegisterViewModel(authServices: self.authServices)
        return viewController
    }
    
}
