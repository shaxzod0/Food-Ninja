//
//  RectButton.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 26/09/22.
//

import UIKit

class RectButton: UIButton {
    init(image: UIImage?, title: String, frame: CGRect) {
        super.init(frame: frame)
        initView(image: image, title: title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initView(image: UIImage?, title: String) {
        setImage(image, for: .normal)
        setTitle(title, for: .normal)
        layer.cornerRadius = 8
        contentHorizontalAlignment = .center
        
        self.contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 16)
        
        backgroundColor = .greenColor
        tintColor = .white
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
