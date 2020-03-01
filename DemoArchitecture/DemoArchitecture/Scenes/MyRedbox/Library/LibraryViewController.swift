//
//  LibraryViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol LibraryViewControllerProtocol: class {
    var onMyPerks: (() -> Void)? { get set }
}

class LibraryViewController: BaseViewController, LibraryViewControllerProtocol {
    
    // MARK: - LibraryViewControllerProtocol
    
    var onMyPerks: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: LibraryViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func myPerks() {
        self.onMyPerks?()
    }
    
}
