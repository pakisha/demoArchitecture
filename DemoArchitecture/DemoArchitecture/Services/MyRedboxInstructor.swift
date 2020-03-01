//
//  MyRedboxInstructor.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/28/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

enum MyRedboxFlow {
    case auth
    case myRedox
}

protocol MyRedboxInstructorProtocol {
    func chooseFlow() -> MyRedboxFlow
}

class MyRedboxInstructor: MyRedboxInstructorProtocol {
    
    // MARK: - Vars & Lets
    
    let keychainServices: KeychainServices
    
    // MARK: - Public methods
    
    func chooseFlow() -> MyRedboxFlow {
        if keychainServices.isLoggedIn {
            return .myRedox
        }
        
        return .auth
    }
    
    // MARK: - Initialization
    
    init(keychainServices: KeychainServices) {
        self.keychainServices = keychainServices
    }
    
}
