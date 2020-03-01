//
//  SearchViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol SearchViewControllerProtocol: class {
    var onTitleDetails: (() -> Void)? { get set }
}

class SearchViewController: BaseViewController, SearchViewControllerProtocol {
    
    // MARK: - SearchViewControllerProtocol
    
    var onTitleDetails: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: SearchViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func titleDetails() {
        self.onTitleDetails?()
    }
    
}
