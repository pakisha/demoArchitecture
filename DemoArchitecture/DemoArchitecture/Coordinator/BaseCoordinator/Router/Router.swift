//
//  Router.swift
//
//  Created by Pavle Pesic on 1/10/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

final class Router: NSObject, RouterProtocol {
    
    // MARK: - Vars & Lets
    
    private weak var rootController: CoordinatorNavigationController?
    private var completions: [UIViewController : () -> Void]
    
    // MARK: - Presentable
    
    func toPresent() -> UIViewController? {
        return self.rootController
    }
    
    // MARK: - RouterProtocol
    
    func present(_ module: Presentable?) {
        self.present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        self.rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func present(_ module: Presentable?, animated: Bool, modalPresentationStyle: UIModalPresentationStyle) {
        guard let controller = module?.toPresent() else { return }
        controller.modalPresentationStyle = modalPresentationStyle
        self.rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        guard let controller = module?.toPresent() else { return }
        self.rootController?.present(controller, animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable?) {
        self.push(module, transition: nil)
    }
    
    func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?) {
        self.push(module, transition: transition, animated: true)
    }
    
    func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?, animated: Bool) {
        self.push(module, transition: transition, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?, animated: Bool, completion: (() -> Void)?) {
        self.rootController?.setTransition(transition: transition)
        
        guard let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        if let completion = completion {
            self.completions[controller] = completion
        }
        self.rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule() {
        self.popModule(transition: nil)
    }
    
    func popModule(transition: UIViewControllerAnimatedTransitioning?) {
        self.popModule(transition: transition, animated: true)
    }
    
    func popModule(transition: UIViewControllerAnimatedTransitioning?, animated: Bool) {
        self.rootController?.setTransition(transition: transition)
        if let controller = rootController?.popViewController(animated: animated) {
            self.runCompletion(for: controller)
        }
    }
    
    func popToModule(module: Presentable?, animated: Bool = true) {
        if let controllers = self.rootController?.viewControllers, let module = module {
            for controller in controllers where controller == module as? UIViewController {
                self.rootController?.popToViewController(controller, animated: animated)
                self.runCompletion(for: controller)
                break
            }
        }
    }
    
    func dismissModule() {
        self.dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        self.rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func setRootModule(_ module: Presentable?, animated: Bool) {
        self.setRootModule(module, hideBar: false, animated: animated)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        self.rootController?.setViewControllers([controller], animated: animated)
        self.rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = self.rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                self.runCompletion(for: controller)
            }
        }
    }
    
    func showTitles() {
        self.rootController?.isNavigationBarHidden = false
    }
    
    func hideTitles() {
        self.rootController?.isNavigationBarHidden = true
    }
    
    func setAdaptivePresentationDelegate(delegate: UIAdaptivePresentationControllerDelegate) {
        self.rootController?.presentationController?.delegate = delegate
    }
    
    // MARK: - Private methods
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = self.completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    // MARK: - Init methods
    
    init(rootController: CoordinatorNavigationController) {
        self.rootController = rootController
        self.completions = [:]
        super.init()
    }
}
