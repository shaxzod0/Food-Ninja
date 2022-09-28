//
//  MenuRepository.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 28/09/22.
//

import RxSwift

class MenuRepository: MenuRepositoryProtocol {
    var menuData = RxSwift.PublishSubject<[MenuModel]>()
    
    func fetchMenu() {
        menuData.on(.next(DummyData.menu))
    }
    
    
}
