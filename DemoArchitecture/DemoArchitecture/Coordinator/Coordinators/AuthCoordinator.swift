//
//  AuthCoordinator.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation
import UIKit

final class AuthCoordinator: BaseCoordinator {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Private methods
    
    private func showLoginRegisterViewController() {
        let viewController = self.factory.instantiateChooseLoginRegisterViewController()
        viewController.onLogin = { [weak self] in
            self?.presentLoginViewController()
        }
        viewController.onRegister = { [weak self] in
            self?.presentRegisterViewController()
        }
        self.router.setRootModule(viewController, hideBar: false, animated: true)
    }
    
    private func presentLoginViewController() {
        let viewController = self.factory.instantiateLoginViewController()
        viewController.didLogin = { [weak self] in
            self?.router.dismissModule()
            self?.finishFlow?()
        }
        self.router.present(viewController)
    }
    
    private func presentRegisterViewController() {
        let viewController = self.factory.instantiateRegisterViewController()
        viewController.didRegister = { [weak self] in
            self?.router.dismissModule()
            self?.finishFlow?()
        }
        self.router.present(viewController)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showLoginRegisterViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        super.init(factory: factory, router: router)
    }
    
}
