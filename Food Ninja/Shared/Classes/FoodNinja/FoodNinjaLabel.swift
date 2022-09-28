//
//  FoodNinjaLabel.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 26/09/22.
//

import UIKit

class FoodNinjaLabel: UILabel {
    
    init(text: String = "", textColor: UIColor = UIColor.black, fontSize: CGFloat = 16, weight: UIFont.Weight = .regular, alignment: NSTextAlignment = .left , fontName: UIFont.fontType = .kFontRegular) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.numberOfLines = 0
        self.font = UIFont.setFont(fontName, size: fontSize)
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
