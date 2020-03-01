//
//  TabbarCoordinator.swift
//  LifestyleIntelligence
//
//  Created by Pavle Pesic on 1/14/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

final class TabBarCoordinator: BaseCoordinator {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Private methods
    
    private func showTabBarController() {
        let viewController = self.factory.instantiateTabBarController()
        viewController.onFirst = { [weak self] in
            self?.startHomeCoordinator(navigationController: $0)
        }
        viewController.onSecond = { [weak self] in
            self?.startSearchCoordinator(navigationController: $0)
        }
        viewController.onThird = { [weak self] in
            self?.startMyRedboxCoordinator(navigationController: $0)
        }
        viewController.onFourth = { [weak self] in
            self?.startProfileCoordinator(navigationController: $0)
        }
        self.router.setRootModule(viewController, hideBar: true, animated: false)
    }
    
    private func startHomeCoordinator(navigationController: CoordinatorNavigationController) {
        let coordinator = self.factory.instantiateHomeCoordinator(navigationController: navigationController)
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func startSearchCoordinator(navigationController: CoordinatorNavigationController) {
        let coordinator = self.factory.instantiateSearchCoordinator(navigationController: navigationController)
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func startMyRedboxCoordinator(navigationController: CoordinatorNavigationController) {
        let coordinator = self.factory.instantiateMyRedboxCoordinator(navigationController: navigationController)
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func startProfileCoordinator(navigationController: CoordinatorNavigationController) {
        
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showTabBarController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        super.init(factory: factory, router: router)
    }
    
}
