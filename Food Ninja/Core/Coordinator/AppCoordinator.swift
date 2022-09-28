//
//  AppCoordinator.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 15/09/22.
//

import UIKit

public class AppCoordinator {
    public var children: [Coordinator] = []
    public let router: Router
    
    public init(router: Router) {
        self.router = router
    }
}
