//
//  AuthCoordinator.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 15/09/22.
//

import UIKit

public class AuthCoordinator: Coordinator {
    
    public var children: [Coordinator] = []
    public let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    public func present(animated: Bool, onDismissed: (()->Void)?) {
        let viewController = LoginViewController()
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
}

extension AuthCoordinator: LoginViewControllerDelegate {
    public func loginViewControllerDidPressScheduleAppointment(_ viewController: LoginViewController) {
        
    }
}
