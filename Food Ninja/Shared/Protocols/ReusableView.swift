//
//  ReusableView.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 26/09/22.
//

import UIKit

protocol ReusableView {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: Self.self)
    }
}
