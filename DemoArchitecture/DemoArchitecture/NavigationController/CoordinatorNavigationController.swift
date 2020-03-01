//
//  CoordinatorNavigationController.swift
//
//  Created by Pavle Pesic on 1/10/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

protocol CoordinatorNavigationControllerDelegate: class {
    func transitionBackFinished()
    func didSelectCustomBackAction()
}

class CoordinatorNavigationController: UINavigationController {
    
    // MARK: - Vars & Lets
    
    private var transition: UIViewControllerAnimatedTransitioning?
    private var shouldEnableSwipeBack = false
    fileprivate var duringPushAnimation = false
    
    // MARK: Back button customization
    
    private var backButtonImage: UIImage?
    private var backButtonTitle: String?
    private var backButtonFont: UIFont?
    private var backButtonTitleColor: UIColor?
    private var shouldUseViewControllerTitles = false
    
    // MARK: Delegates
    
    weak var swipeBackDelegate: CoordinatorNavigationControllerDelegate?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    // MARK: - Public methods
    
    func setTransition(transition: UIViewControllerAnimatedTransitioning?) {
        if self.shouldEnableSwipeBack {
            self.enableSwipeBack()
        }
        
        self.transition = transition
        
        if transition != nil {
            self.disableSwipeBack()
        }
    }
    
    func customizeBackButton(backButtonImage: UIImage? = nil, backButtonTitle: String? = nil, backButtonFont: UIFont? = nil, backButtonTitleColor: UIColor? = nil, shouldUseViewControllerTitles: Bool = false) {
        self.backButtonImage = backButtonImage
        self.backButtonTitle = backButtonTitle
        self.backButtonFont = backButtonFont
        self.backButtonTitleColor = backButtonTitleColor
        self.shouldUseViewControllerTitles = shouldUseViewControllerTitles
    }
    
    func customizeTitle(titleColor: UIColor, largeTextFont: UIFont, smallTextFont: UIFont, isTranslucent: Bool = true, barTintColor: UIColor? = nil, largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode = .never) {
        self.navigationItem.largeTitleDisplayMode = largeTitleDisplayMode
        self.navigationBar.prefersLargeTitles = true
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: titleColor]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
            navBarAppearance.backgroundColor = barTintColor
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            UINavigationBar.customNavBarStyle(color: titleColor, largeTextFont: largeTextFont, smallTextFont: smallTextFont, isTranslucent: isTranslucent, barTintColor: barTintColor)
        }
    }
    
    func enableSwipeBack() {
        self.shouldEnableSwipeBack = true
        self.interactivePopGestureRecognizer?.isEnabled = true
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - Private methods
    
    private func disableSwipeBack() {
        self.interactivePopGestureRecognizer?.isEnabled = false
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    private func setupCustomBackButton(viewController: UIViewController) {
        if self.backButtonImage != nil || self.backButtonTitle != nil {
            viewController.navigationItem.hidesBackButton = true
            let backButtonTitle = self.shouldUseViewControllerTitles ? self.viewControllers[self.viewControllers.count - 2].title : self.backButtonTitle
            let button = NavigationControllerCustomBackButton.initCustomBackButton(self.backButtonImage, backButtonTitle, self.backButtonFont, self.backButtonTitleColor)
            button.addTarget(self, action: #selector(actionBack(sender:)), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    // MARK: - Actions
    
    @objc private func actionBack(sender: UIBarButtonItem) {
        self.swipeBackDelegate?.didSelectCustomBackAction()
    }
    
    // MARK: - Overrides
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.duringPushAnimation = true
        super.pushViewController(viewController, animated: animated)
        self.setupCustomBackButton(viewController: viewController)
    }
    
    // MARK: - Initialization
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

// MARK: - Extensions
// MARK: - UIGestureRecognizerDelegate

extension CoordinatorNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == self.interactivePopGestureRecognizer else {
            return true
        }
        
        return self.viewControllers.count > 1 && self.duringPushAnimation == false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

// MARK: - UINavigationControllerDelegate

extension CoordinatorNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let coordinator = navigationController.topViewController?.transitionCoordinator {
            coordinator.notifyWhenInteractionChanges { (context) in
                if !context.isCancelled {
                    self.swipeBackDelegate?.transitionBackFinished()
                }
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let swipeNavigationController = navigationController as? CoordinatorNavigationController else { return }
        
        swipeNavigationController.duringPushAnimation = false
    }
    
}
