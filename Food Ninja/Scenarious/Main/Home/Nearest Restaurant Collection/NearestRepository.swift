//
//  NearestRepository.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 27/09/22.
//

import RxSwift

class NearestRepository: NearestRepositoryProtocol {
    var restaurantData = PublishSubject<[RestaurantModel]>()
    
    func fetchRestaurant() {
        restaurantData.on(.next(DummyData.restaurant))
    }
}
