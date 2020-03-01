//
//  MyRedboxViewControllerFactoryImp.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: MyRedboxViewControllerFactory {
    
    func instantiateLibraryViewController() -> LibraryViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.myRedbox.instantiateViewController(withIdentifier: "LibraryViewController") as! LibraryViewController
        viewController.viewModel = LibraryViewModel()
        return viewController
    }
    
    func instantiateMyPerksViewController() -> MyPerksViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.myRedbox.instantiateViewController(withIdentifier: "MyPerksViewController") as! MyPerksViewController
        viewController.viewModel = MyPerksViewModel()
        return viewController
    }
    
}
