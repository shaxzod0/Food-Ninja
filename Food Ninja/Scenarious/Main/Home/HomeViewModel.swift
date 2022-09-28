//
//  HomeViewModel.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 08/09/22.
//

import RxSwift

class HomeViewModel {
    var restaurant = BehaviorSubject(value: [NearestRestarauntCollectionView.DataModel]())
    let disposeBag = DisposeBag()
    
    let repository: NearestRepositoryProtocol?
    
    init(repository: NearestRepositoryProtocol) {
        self.repository = repository
        
        repository.restaurantData.subscribe { [weak self] (response) in
            self?.restaurant.on(.next([NearestRestarauntCollectionView.DataModel(model: "", items: response)]))
        }.disposed(by: disposeBag)
    }
}
