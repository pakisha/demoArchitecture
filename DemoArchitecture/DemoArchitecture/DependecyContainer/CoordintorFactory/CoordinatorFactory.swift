//
//  CoordinatorFactory.swift
//
//  Created by Pavle Pesic on 1/10/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator
    func instantiateMyRedboxCoordinator(navigationController: CoordinatorNavigationController) -> MyRedboxCoordinator
    func instantiateHomeCoordinator(navigationController: CoordinatorNavigationController) -> HomeCoordinator
    func instantiateSearchCoordinator(navigationController: CoordinatorNavigationController) -> SearchCoordinator
    func instantiateTabBarCoordinator() -> TabBarCoordinator
    func instantiateTitleCoordinator(router: RouterProtocol) -> TitleCoordinator
}
