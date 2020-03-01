//
//  HomeCoordinator.swift
//  LifestyleIntelligence
//
//  Created by Pavle Pesic on 1/14/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

final class HomeCoordinator: BaseCoordinator {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Private methods
    
    private func showHomeController() {
        let viewController = self.factory.instantiateHomeViewController()
        viewController.onTitleDetails = { [weak self] in
            self?.startTitleCoordinator()
        }
        self.router.setRootModule(viewController, hideBar: false, animated: true)
    }
    
    private func startTitleCoordinator() {
        let coordinator = self.factory.instantiateTitleCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showHomeController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        super.init(factory: factory, router: router)
    }
    
}
