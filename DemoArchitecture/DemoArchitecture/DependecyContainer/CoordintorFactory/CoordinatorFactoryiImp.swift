//
//  CoordinatorFactoryiImp.swift
//
//  Created by Pavle Pesic on 1/14/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

extension DependencyContainer: CoordinatorFactoryProtocol {
    
    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator {
        AuthCoordinator(router: router, factory: self)
    }
    
    func instantiateMyRedboxCoordinator(navigationController: CoordinatorNavigationController) -> MyRedboxCoordinator {
        MyRedboxCoordinator(router: Router(rootController: navigationController),
                            factory: self,
                            instructor: self.instructor)
    }
    
    func instantiateHomeCoordinator(navigationController: CoordinatorNavigationController) -> HomeCoordinator {
           HomeCoordinator(router: Router(rootController: navigationController), factory: self)
       }
    
    func instantiateTabBarCoordinator() -> TabBarCoordinator {
        TabBarCoordinator(router: self.router, factory: self)
    }
    
    func instantiateSearchCoordinator(navigationController: CoordinatorNavigationController) -> SearchCoordinator {
        SearchCoordinator(router: Router(rootController: navigationController), factory: self)
    }
    
    func instantiateTitleCoordinator(router: RouterProtocol) -> TitleCoordinator {
        TitleCoordinator(router: router, factory: self)
    }
    
}
