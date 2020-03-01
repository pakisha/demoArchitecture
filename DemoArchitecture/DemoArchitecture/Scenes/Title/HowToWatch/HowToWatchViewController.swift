//
//  HowToWatchViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/29/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol HowToWatchViewControllerProtocol: class {
    
}

class HowToWatchViewController: BaseViewController, HowToWatchViewControllerProtocol {
    
    // MARK: - Vars & Lets
    
    var viewModel: HowToWatchViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func dismiss() {
        self.onBack?(true)
    }
}
