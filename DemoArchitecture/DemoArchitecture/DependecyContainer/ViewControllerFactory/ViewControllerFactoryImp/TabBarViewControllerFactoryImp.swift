//
//  TabBarViewControllerFactoryImp.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: TabBarControllerFactory {
    
    func instantiateTabBarController() -> TabBarViewControllerProtocol & Presentable {
        let viewController = UIStoryboard.tabBar.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        viewController.viewModel = TabBarViewModel()
        return viewController
    }
    
}
