//
//  PopularMenuCollectionView.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 27/09/22.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa
import RxGesture

class PopularMenuCollectionView: UICollectionView {
    typealias DataModel = SectionModel<String, MenuModel>
    
    weak var disposeBag: DisposeBag!
    
    init(disposeBag: DisposeBag) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 15
        flowLayout.minimumInteritemSpacing = 15
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        self.disposeBag = disposeBag
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        self.register(PopularMenuCell.self)
        self.backgroundColor = .clear
        self.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    public func itemSelected() -> ControlEvent<MenuModel> {
        return self.rx.modelSelected(MenuModel.self)
    }
    
    public func bind(items: Observable<[DataModel]>) {
        let dataSource = RxCollectionViewSectionedReloadDataSource<DataModel>(configureCell: { (_, collectionView, indexPath, item) in
            let cell: PopularMenuCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.model = item
            return cell
        })
        items
            .bind(to: self.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension PopularMenuCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        return CGSize(width: width, height: 90)
    }
}
