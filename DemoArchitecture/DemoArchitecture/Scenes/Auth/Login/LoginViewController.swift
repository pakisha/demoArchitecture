//
//  LoginViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol LoginViewControllerProtocol: class {
    var didLogin: (() -> Void)? { get set }
}

class LoginViewController: BaseViewController, LoginViewControllerProtocol {
    
    // MARK: - LoginViewControllerProtocol
    
    var didLogin: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: LoginViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func login() {
        self.viewModel?.login()
        self.didLogin?()
    }
    
}
