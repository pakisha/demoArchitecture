//
//  TitleDetailsViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/29/20.
//  Copyright (c) 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol TitleDetailsViewControllerProtocol: class {
    var onHowToWatch: (() -> Void)? { get set }
}

class TitleDetailsViewController: BaseViewController, TitleDetailsViewControllerProtocol {
    
    // MARK: - TitleDetailsViewControllerProtocol
    
    var onHowToWatch: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: TitleDetailsViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func howToWatch() {
        self.onHowToWatch?()
    }
    
}
