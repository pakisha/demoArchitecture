//
//  TabBarViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol TabBarViewControllerProtocol: class {
    var onFirst: ((_ navigationController: CoordinatorNavigationController) -> Void)? { get set }
    var onSecond: ((_ navigationController: CoordinatorNavigationController) -> Void)? { get set }
    var onThird: ((_ navigationController: CoordinatorNavigationController) -> Void)? { get set }
    var onFourth: ((_ navigationController: CoordinatorNavigationController) -> Void)? { get set }
}

class TabBarViewController: UITabBarController, TabBarViewControllerProtocol {
    
    // MARK: - TabBarViewControllerProtocol
    
    var onFirst: ((CoordinatorNavigationController) -> Void)?
    var onSecond: ((CoordinatorNavigationController) -> Void)?
    var onThird: ((CoordinatorNavigationController) -> Void)?
    var onFourth: ((CoordinatorNavigationController) -> Void)?

    // MARK: - Vars & Lets
    
    var viewModel: TabBarViewModelProtocol!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preloadAllControllers()
    }
    
    // MARK: - Private methods
    
    private func setupTabBar() {
        
    }
    
    private func preloadAllControllers() {
        if let viewControllers = self.viewControllers {
            for (index, navController) in viewControllers.enumerated() {
                if let navController = navController as? CoordinatorNavigationController {
                    self.setupNavigationController(navigationController: navController)
                    navController.customizeBackButton(backButtonImage: UIImage(named: "back"),
                                                      backButtonTitle: "Back",
                                                      backButtonFont: nil,
                                                      backButtonTitleColor: .white,
                                                      shouldUseViewControllerTitles: true)
                    if index == 0 {
                        self.onFirst?(navController)
                    } else if index == 1 {
                        self.onSecond?(navController)
                    } else if index == 2 {
                        self.onThird?(navController)
                    } else if index == 3 {
                        self.onFourth?(navController)
                    }
                }
            }
        }
    }
    
    private func setupNavigationController(navigationController: CoordinatorNavigationController) {
        navigationController.customizeTitle(titleColor: .white,
                                            largeTextFont: UIFont.boldSystemFont(ofSize: 34),
                                            smallTextFont: UIFont.systemFont(ofSize: 12),
                                            isTranslucent: false,
                                            barTintColor: UIColor.systemBlue,
                                            largeTitleDisplayMode: .automatic)
        navigationController.navigationBar.tintColor = .white
    }
    
}
