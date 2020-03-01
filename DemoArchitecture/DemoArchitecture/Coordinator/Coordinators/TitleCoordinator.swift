//
//  TitleCoordinator.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/29/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

final class TitleCoordinator: BaseCoordinator {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Private methods
    
    private func showSearchController() {
        let viewController = self.factory.instantiateTitleDetailsViewController()
        viewController.onBack = { [weak self] in
            if $0 { self?.router.popModule() }
            self?.finishFlow?()
        }
        viewController.onHowToWatch = { [weak self] in
            self?.presentHowToWatchViewController()
        }
        self.router.push(viewController)
    }
    
    private func presentHowToWatchViewController() {
        let viewController = self.factory.instantiateHowToWatchViewController()
        viewController.onBack = { [weak self] _ in
            self?.router.dismissModule()
        }
        self.router.present(viewController, animated: true, modalPresentationStyle: .overFullScreen)
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
