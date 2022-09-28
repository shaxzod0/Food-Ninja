//
//  NavigationRouter.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 15/09/22.
//

import UIKit

public class NavigationRouter: NSObject {
    
    // MARK: - Instance Properties
    public unowned let parentViewController: UIViewController
    
    private let navigationController = UINavigationController()
    private var onDismissForViewController:
    [UIViewController: (() -> Void)] = [:]
    
    // MARK: - Object Lifecycle
    public init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init()
        navigationController.delegate = self
    }
}

// MARK: - Router
extension NavigationRouter: Router {
    
    public func present(_ viewController: UIViewController,
                        animated: Bool,
                        onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed
        if navigationController.viewControllers.count == 0 {
            presentModally(viewController, animated: animated)
        } else {
            navigationController.pushViewController(
                viewController, animated: animated)
        }
    }
    
    private func presentModally(
        _ viewController: UIViewController,
        animated: Bool) {
            addCancelButton(to: viewController)
            navigationController.setViewControllers(
                [viewController], animated: false)
            parentViewController.present(navigationController,
                                         animated: animated,
                                         completion: nil)
        }
    
    private func addCancelButton(to
                                 viewController: UIViewController) {
        viewController.navigationItem.leftBarButtonItem =
        UIBarButtonItem(title: "Cancel",
                        style: .plain,
                        target: self,
                        action: #selector(cancelPressed))
    }
    
    @objc private func cancelPressed() {
        performOnDismissed(for:
                            navigationController.viewControllers.first!)
        dismiss(animated: true)
    }
    
    public func dismiss(animated: Bool) {
        performOnDismissed(for:
                            navigationController.viewControllers.first!)
        parentViewController.dismiss(animated: animated,
                                     completion: nil)
    }
    
    private func performOnDismissed(for
                                    viewController: UIViewController) {
        guard let onDismiss =
                onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

// MARK: - UINavigationControllerDelegate
extension NavigationRouter:
    UINavigationControllerDelegate {
    
    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool) {
            
            guard let dismissedViewController =
                    navigationController.transitionCoordinator?
                .viewController(forKey: .from),
                  !navigationController.viewControllers
                .contains(dismissedViewController) else {
                return
            }
            performOnDismissed(for: dismissedViewController)
        }
}
