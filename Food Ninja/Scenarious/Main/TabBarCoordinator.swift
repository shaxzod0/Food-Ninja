//
//  TabBarCoordinator.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 16/09/22.
//

import UIKit

class TabBarCoordinator: Coordinator {
    public var children: [Coordinator] = []
    public let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = TabBarViewController()
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
}
