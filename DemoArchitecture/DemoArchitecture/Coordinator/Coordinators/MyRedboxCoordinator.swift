//
//  MyRedboxCoordinator.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

final class MyRedboxCoordinator: BaseCoordinator {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let instructor: MyRedboxInstructorProtocol
    
    // MARK: - Private methods
    
    private func chooseFlow() {
        switch instructor.chooseFlow() {
        case .auth:
            self.startAuthCoordinator()
        case .myRedox:
            self.showMyPerksViewController(animated: true)
        }
    }
    
    private func showMyPerksViewController(animated: Bool) {
        let viewController = self.factory.instantiateMyPerksViewController()
        viewController.onLibrary = { [weak self] in
            self?.showLibraryViewController()
        }
        self.router.setRootModule(viewController, hideBar: true, animated: animated)
    }
    
    private func showLibraryViewController() {
        let viewController = self.factory.instantiateLibraryViewController()
        viewController.onMyPerks = { [weak self] in
            self?.showMyPerksViewController(animated: false)
        }
        self.router.setRootModule(viewController, hideBar: true, animated: false)
    }
    
    private func startAuthCoordinator() {
        let coordinator = self.factory.instantiateAuthCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.chooseFlow()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.chooseFlow()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory, instructor: MyRedboxInstructorProtocol) {
        self.instructor = instructor
        super.init(factory: factory, router: router)
    }
    
}
