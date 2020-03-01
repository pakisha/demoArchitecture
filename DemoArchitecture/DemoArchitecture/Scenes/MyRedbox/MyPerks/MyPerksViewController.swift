//
//  MyPerksViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/27/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//
import UIKit

protocol MyPerksViewControllerProtocol: class {
    var onLibrary: (() -> Void)? { get set }
}

class MyPerksViewController: BaseViewController, MyPerksViewControllerProtocol {
    
    // MARK: - MyPerksViewControllerProtocol
    
    var onLibrary: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: MyPerksViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func library() {
        self.onLibrary?()
    }
    
}
