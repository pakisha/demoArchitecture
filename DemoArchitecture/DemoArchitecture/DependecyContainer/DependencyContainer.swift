//
//  DependencyContainer.swift
//
//  Created by Pavle Pesic on 1/10/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation
import UIKit

typealias Factory = CoordinatorFactoryProtocol & ViewControllerFactory
typealias ViewControllerFactory = AuthViewControllerFactory & MyRedboxViewControllerFactory & HomeViewControllerFactory & SearchViewControllerFactory & TabBarControllerFactory & TitleViewControllerFactory

class DependencyContainer {

    // MARK: - Vars & Lets
    
    // MARK: App Coordinator
    
    internal lazy var tabBarCoordinator = self.instantiateTabBarCoordinator()
    
    // MARK: Routing
    
    internal var rootController: CoordinatorNavigationController
    internal lazy var router = Router(rootController: self.rootController)
    
    // MARK: - Networking
    
    internal lazy var authServices = AuthServices(keychainServices: self.keychainServices)
    internal lazy var vodServices = VODServices()
    
    // MARK: Other services
    
    internal lazy var keychainServices = KeychainServices()
    internal lazy var instructor = MyRedboxInstructor(keychainServices: self.keychainServices)
    
    // MARK: - Public func
    
    func start() {
        self.tabBarCoordinator.start()
    }
    
    // MARK: - Initialization
    
    init(rootController: CoordinatorNavigationController) {
        self.rootController = rootController
    }
    
}
