//
//  MenuProtocol.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 28/09/22.
//

import RxSwift

protocol MenuRepositoryProtocol {
    var menuData: PublishSubject<[MenuModel]> { get }
    func fetchMenu()
}
