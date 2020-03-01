//
//  SearchViewModel.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol SearchViewModelProtocol {
    
}

class SearchViewModel: NSObject, SearchViewModelProtocol {
    
    // MARK: - Vars & Lets
    
    private let vodServices: VODServicesProtocol
    
    // MARK: - Init
    
    init(vodServices: VODServicesProtocol) {
        self.vodServices = vodServices
        super.init()
    }
    
}
