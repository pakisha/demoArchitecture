//
//  ChooseLoginRegisterViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol ChooseLoginRegisterViewControllerProtocol: class {
    var onLogin: (() -> Void)? { get set }
    var onRegister: (() -> Void)? { get set }
}

class ChooseLoginRegisterViewController: BaseViewController, ChooseLoginRegisterViewControllerProtocol {
    
    // MARK: - ChooseLoginRegisterViewControllerProtocol
    
    var onLogin: (() -> Void)?
    var onRegister: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: ChooseLoginRegisterViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func login() {
        self.onLogin?()
    }
    
    @IBAction private func register() {
        self.onRegister?()
    }
    
}
