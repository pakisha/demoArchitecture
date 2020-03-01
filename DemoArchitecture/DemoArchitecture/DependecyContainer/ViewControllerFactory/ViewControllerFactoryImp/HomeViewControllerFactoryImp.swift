//
//  HomeViewControllerFactoryImp.swift
//  LifestyleIntelligence
//
//  Created by Pavle Pesic on 1/14/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//  swiftlint:disable force_cast

import UIKit

extension DependencyContainer: HomeViewControllerFactory {
    
    func instantiateHomeViewController() -> HomeViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.home.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        viewController.viewModel = HomeViewModel(vodServices: self.vodServices)
        return viewController
    }
    
}
