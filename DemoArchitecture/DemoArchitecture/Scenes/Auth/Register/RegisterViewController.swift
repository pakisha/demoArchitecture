//
//  RegisterViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol RegisterViewControllerProtocol: class {
    var didRegister: (() -> Void)? { get set }
}

class RegisterViewController: BaseViewController, RegisterViewControllerProtocol {
    
    // MARK: - RegisterViewControllerProtocol
    
    var didRegister: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: RegisterViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func register() {
        self.viewModel?.register()
        self.didRegister?()
    }
    
}
