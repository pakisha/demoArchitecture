//
//  RegisterViewModel.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol RegisterViewModelProtocol {
    func register()
}

class RegisterViewModel: NSObject, RegisterViewModelProtocol {
    
    // MARK: - Vars & Lets
    
    private var authServices: AuthServicesProtocol
    
    // MARK: - Public methods
    
    func register() {
        self.authServices.login()
    }
    
    // MARK: - Init
    
    init(authServices: AuthServices) {
        self.authServices = authServices
        super.init()
    }
    
}
