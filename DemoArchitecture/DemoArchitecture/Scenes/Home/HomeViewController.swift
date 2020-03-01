//
//  HomeViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: class {
    var onTitleDetails: (() -> Void)? { get set }
}

class HomeViewController: BaseViewController, HomeViewControllerProtocol {
    
    // MARK: - HomeViewControllerProtocol
    
    var onTitleDetails: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: HomeViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func titleDetails() {
        self.onTitleDetails?()
    }
    
}
