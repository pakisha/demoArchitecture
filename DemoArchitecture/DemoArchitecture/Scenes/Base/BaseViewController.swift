//
//  BaseViewController.swift
//  DemoArchitecture
//
//  Created by Pavle Pesic on 2/28/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

typealias ViewControllerProtocol = Presentable & BaseViewControllerProtocol

protocol BaseViewControllerProtocol: class {
    var onBack: ((_ shouldPop: Bool) -> Void)? { get set }
}

class BaseViewController: UIViewController, CoordinatorNavigationControllerDelegate, BaseViewControllerProtocol {
    
    // MARK: - BaseViewControllerProtocol
    
    var onBack: ((Bool) -> Void)?
    
    // MARK: - Vars & Lets
    
    var keyboardOnScreen = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Controller lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupNavigationController()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Private methods
    
    internal func setupNavigationController() {
        if let navigationController = self.navigationController as? CoordinatorNavigationController {
            navigationController.swipeBackDelegate = self
        }
    }
    
    internal func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow(notification:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide(notification:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    internal func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // MARK: - SwipeBackNavigationControllerDelegate
    
    internal func transitionBackFinished() {
        
    }
    
    internal func didSelectCustomBackAction() {
        self.onBack?(true)
    }
    
    @objc internal func keyboardWillShow(notification: NSNotification) {
        
    }
    
    @objc internal func keyboardDidShow(notification: NSNotification) {
        self.keyboardOnScreen = true
    }
    
    @objc internal func keyboardWillHide(notification: NSNotification) {
        
    }
    
    @objc internal func keyboardDidHide(notification: NSNotification) {
        self.keyboardOnScreen = false
    }
    
    // MARK: - Actions
    
    @IBAction internal func back() {
        self.onBack?(true)
    }

}
