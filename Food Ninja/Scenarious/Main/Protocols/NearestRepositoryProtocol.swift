//
//  NearestRepositoryProtocol.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 27/09/22.
//

import RxSwift

protocol NearestRepositoryProtocol {
    var restaurantData: PublishSubject<[RestaurantModel]> { get }
    
    func fetchRestaurant()
}
