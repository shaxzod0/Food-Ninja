//
//  BaseCollectionViewCell.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 25/09/22.
//

import UIKit

class BaseCollectionViewCell<CellModel>: UICollectionViewCell, ReusableView {
    
    typealias CellModel = CellModel
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    var model: CellModel?{
        didSet{
            updateUI()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initViews(){
    }
    private func updateUI(){
        if let model = model{
            updateUI(with: model)
        }
    }
    func updateUI(with model: CellModel){
    }
    
}

