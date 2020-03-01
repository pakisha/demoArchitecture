//
//  SearchControllerFactoryImp.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: SearchViewControllerFactory {
    
    func instantiateSearchController() -> SearchViewControllerProtocol & ViewControllerProtocol {
        let viewController = UIStoryboard.search.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        viewController.viewModel = SearchViewModel(vodServices: self.vodServices)
        return viewController
    }
    
}
