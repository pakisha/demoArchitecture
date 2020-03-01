//
//  AuthServices.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 3/1/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

protocol AuthServicesProtocol {
    func login()
}

class AuthServices: AuthServicesProtocol {
    
    // MARK: - Vars & Lets
    
    private let keychainServices: KeychainServices
    
    // MARK: - Public methods
    
    func login() {
        self.keychainServices.isLoggedIn = true
    }
    
    // MARK: - Initialization
    
    init(keychainServices: KeychainServices) {
        self.keychainServices = keychainServices
    }
    
}
