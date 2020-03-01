//
//  LoginViewModel.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol LoginViewModelProtocol {
    func login()
}

class LoginViewModel: NSObject, LoginViewModelProtocol {
    
    // MARK: - Vars & Lets
    
    private var authServices: AuthServicesProtocol
    
    // MARK: - Public methods
    
    func login() {
        self.authServices.login()
    }
    
    // MARK: - Init
    
    init(authServices: AuthServices) {
        self.authServices = authServices
        super.init()
    }
    
}
