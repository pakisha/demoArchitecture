//
//  BaseCoordinator.swift
//
//  Created by Pavle Pesic on 1/10/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    // MARK: - Vars & Lets
    
    var childCoordinators = [Coordinator]()
    internal let factory: Factory
    internal let router: RouterProtocol
    
    // MARK: - Public methods
    
    func addDependency(_ coordinator: Coordinator) {
        for element in self.childCoordinators where element === coordinator {
            return
        }
        self.childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard self.childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            self.childCoordinators.remove(at: index)
            break
        }
    }
    
    func removeLastDependecy() {
        guard self.childCoordinators.isEmpty == false else { return }
        self.childCoordinators.removeLast()
    }
    
    // MARK: - Coordinator
    
    func start() {
        self.start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        
    }
    
    // MARK: - Initialization
    
    init(factory: Factory, router: RouterProtocol) {
        self.factory = factory
        self.router = router
    }
    
}
