//
//  HomeViewController.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 08/09/22.
//

import UIKit
import RxSwift

protocol HomeControllerDelegate {
    func navigateToNextScreen(_ viewController: HomeViewController)
}

class HomeViewController: BaseViewController {
    
    var viewModel: HomeViewModel?
    var delegate: HomeControllerDelegate?
    
    lazy var collectionView: NearestRestarauntCollectionView = .init(bag: disposeBag)
    
}

//MARK: - Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.viewModel?.repository?.fetchRestaurant()
        self.viewModel?.restaurant.bind(to: { res in
            collectionView.bind(items: res)
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override  func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override  func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}



//MARK: - User interface

extension HomeViewController {
    fileprivate func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .red
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.itemSelected().debounce(.microseconds(300), scheduler: MainScheduler.instance).subscribe(onNext: { model in
            self.delegate?.navigateToNextScreen(self)
        }).disposed(by: disposeBag)
    }
    private func setupUI() {
        setupCollectionView()
    }
}
