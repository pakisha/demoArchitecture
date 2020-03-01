//
//  ViewControllerFactory.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

protocol AuthViewControllerFactory {
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginRegisterViewControllerProtocol & ViewControllerProtocol
    func instantiateLoginViewController() -> LoginViewControllerProtocol & ViewControllerProtocol
    func instantiateRegisterViewController() -> RegisterViewControllerProtocol & ViewControllerProtocol
}

protocol HomeViewControllerFactory {
    func instantiateHomeViewController() -> HomeViewControllerProtocol & ViewControllerProtocol
}

protocol MyRedboxViewControllerFactory {
    func instantiateLibraryViewController() -> LibraryViewControllerProtocol & ViewControllerProtocol
    func instantiateMyPerksViewController() -> MyPerksViewControllerProtocol & ViewControllerProtocol
}

protocol SearchViewControllerFactory {
    func instantiateSearchController() -> SearchViewControllerProtocol & ViewControllerProtocol
}

protocol TabBarControllerFactory {
    func instantiateTabBarController() -> TabBarViewControllerProtocol & Presentable
}

protocol TitleViewControllerFactory {
    func instantiateTitleDetailsViewController() -> TitleDetailsViewControllerProtocol & ViewControllerProtocol
    func instantiateHowToWatchViewController() -> HowToWatchViewControllerProtocol & ViewControllerProtocol
}
