//
//  NearestRestarauntCollectionView.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 25/09/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import RxGesture

class NearestRestarauntCollectionView: UICollectionView {
    typealias DataModel = SectionModel<String, RestaurantModel>
    weak var bag: DisposeBag!
    
    init(bag: DisposeBag) {
        let flowLayout: UICollectionViewFlowLayout = .init()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        self.bag = bag
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initViews() {
        self.register(NearestRestaurantCell.self)
        self.backgroundColor = .clear
        self.rx.setDelegate(self).disposed(by: bag)
    }
    public func itemSelected() -> ControlEvent<RestaurantModel> {
        return self.rx.modelSelected(RestaurantModel.self)
    }
    public func bind(items: Observable<[DataModel]>) {
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<DataModel> (configureCell: { (_, collectionView, indexPath, item) in
            let cell: NearestRestaurantCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.model = item
            cell.backgroundColor = .orange
            return cell
        })
        items.bind(to: self.rx.items(dataSource: dataSource)).disposed(by: bag)
    }
}

extension NearestRestarauntCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
