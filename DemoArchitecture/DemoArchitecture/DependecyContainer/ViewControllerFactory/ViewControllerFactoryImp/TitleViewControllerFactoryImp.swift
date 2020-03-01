//
//  TitleViewControllerFactoryImp.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/29/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: TitleViewControllerFactory {
    
    func instantiateTitleDetailsViewController() -> TitleDetailsViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.title.instantiateViewController(withIdentifier: "TitleDetailsViewController") as! TitleDetailsViewController
        viewController.viewModel = TitleDetailsViewModel()
        return viewController
    }
    
    func instantiateHowToWatchViewController() -> HowToWatchViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.title.instantiateViewController(withIdentifier: "HowToWatchViewController") as! HowToWatchViewController
        viewController.viewModel = HowToWatchViewModel()
        return viewController
    }
    
}
