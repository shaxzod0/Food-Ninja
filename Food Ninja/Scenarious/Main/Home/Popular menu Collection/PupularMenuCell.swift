//
//  PupularMenuCell.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 27/09/22.
//

import UIKit

class PopularMenuCell: BaseCollectionViewCell<MenuModel> {
    
    var image: FoodNinjaImageView = .init()
    var name: FoodNinjaLabel = .init()
    var price: FoodNinjaLabel = .init()
    var subtitle: FoodNinjaLabel = .init()
    
    override func initViews() {
        self.layer.cornerRadius = 15
        self.backgroundColor = .white
        
        self.addSubview(image)
        image.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(20)
        }
        self.addSubview(name)
        name.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top)
            make.left.equalTo(image.snp.right).offset(10)
        }
        self.addSubview(subtitle)
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(name.snp.left)
        }
        self.addSubview(price)
        price.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }
    }
    override func updateUI(with model: MenuModel) {
        image.image = UIImage(named: model.image)
        name.text = model.name
        subtitle.text = model.subtitle
        price.text = "\(model.price)"
    }
}
