//
//  NearestRestaurantCell.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 25/09/22.
//

import UIKit
import SnapKit

class NearestRestaurantCell: BaseCollectionViewCell<RestaurantModel> {
    var restaurantLogo: FoodNinjaImageView = .init()
    var restaurantName: FoodNinjaLabel = .init()
    var restaurantDesc: FoodNinjaLabel = .init()
    
    override func initViews() {
        self.layer.cornerRadius = 15
        self.backgroundColor = .red
        self.addSubview(restaurantLogo)
        restaurantLogo.snp.makeConstraints { make in
            make.height.width.equalTo(70)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        self.addSubview(restaurantName)
        restaurantName.snp.makeConstraints { make in
            make.top.equalTo(restaurantLogo.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        self.addSubview(restaurantDesc)
        restaurantDesc.snp.makeConstraints { make in
            make.top.equalTo(restaurantName.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
    }
    override func updateUI(with model: RestaurantModel) {
        restaurantLogo.image = UIImage(named: model.icon)
        restaurantName.text = model.name
        restaurantDesc.text = model.desctription
    }
}
