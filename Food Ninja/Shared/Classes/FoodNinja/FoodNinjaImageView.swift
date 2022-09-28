//
//  FoodNinjaImageView.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 26/09/22.
//

import UIKit

class FoodNinjaImageView: UIImageView {
    
    init(image: UIImage? = nil, contentMode: UIView.ContentMode = .scaleAspectFit) {
        super.init(frame: .zero)
        self.image = image
        self.contentMode = contentMode
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
