//
//  AppDelegateRouter.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 15/09/22.
//

import UIKit

public class AppDelegateRouter: Router {
    
    public let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: ( () -> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    public func dismiss(animated: Bool) {
        
    }
}
