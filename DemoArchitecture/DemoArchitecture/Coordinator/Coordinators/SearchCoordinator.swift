//
//  SearchCoordinator.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

final class SearchCoordinator: BaseCoordinator {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Private methods
    
    private func showSearchController() {
        let viewController = self.factory.instantiateSearchController()
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
        self.showSearchController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        super.init(factory: factory, router: router)
    }
    
}

