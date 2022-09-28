//
//  CardContainerView.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 20/09/22.
//

import UIKit

class CardContainerView: UIView {
    private var didLayoutSubviews = false
    
    public required init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard !didLayoutSubviews else { return }
        didLayoutSubviews = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.quaternarySystemFill.cgColor
    }
}

private extension CardContainerView {
    func configureUI() {
        layer.cornerRadius = 12
        clipsToBounds = true
    }
}
