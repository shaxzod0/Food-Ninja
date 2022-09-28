//
//  BaseViewController.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 26/09/22.
//

import RxReachability
import UIKit
import Reachability
import RxSwift

class BaseViewController: UIViewController {
    // MARK: - Proporties
    var disposeBag: DisposeBag = .init()
    var loadingView: UIView = .init()
    var noConnectionView: UIView = .init()
    var loadingText: String?
    var reachability: Reachability?
    var backgroundImage: FoodNinjaImageView = .init(image: UIImage(named: "background"))
    
    // MARK: - Fields
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var isLoading: Bool = false {
        didSet {
            loadingView.isHidden = !isLoading
        }
    }
    
    var noConnection: Bool = false {
        didSet {
            noConnectionView.isHidden = !noConnection
        }
    }
    
    //MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - View lifecycle
extension BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            reachability = try Reachability()
        } catch {
            
        }
        reachability?.rx.isConnected.observe(on: MainScheduler.instance).subscribe(onNext: { () in
            if !self.isLoading && self.noConnection {
                
            }
        }).disposed(by: disposeBag)
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        try? reachability?.startNotifier()
    }
    override func viewDidAppear(_ animated: Bool) {
        reachability?.stopNotifier()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

//MARK: - Setup UI
extension BaseViewController {
    private func setupUI() {
        var indicator: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            indicator = .init(style: .large)
        } else {
            indicator = .init(style: .gray)
        }
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        loadingView.addSubview(indicator)
        let loadingLabel: UILabel = .init()
        loadingLabel.text = loadingText
        loadingLabel.font = .systemFont(ofSize: 16, weight: .bold)
        loadingLabel.textColor = .gray
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingView.addSubview(loadingLabel)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.isHidden = true
        view.addSubview(loadingView)
        
        indicator.topAnchor.constraint(equalTo: loadingView.topAnchor).isActive = true
        indicator.rightAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: loadingView.rightAnchor, multiplier: 1).isActive = true
        indicator.leftAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: loadingView.leftAnchor, multiplier: 1).isActive = true
        indicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        
        loadingLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 4).isActive = true
        loadingLabel.leftAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: loadingView.leftAnchor, multiplier: 1).isActive = true
        loadingLabel.rightAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: loadingView.rightAnchor, multiplier: 1).isActive = true
        
        loadingLabel.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        loadingLabel.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor).isActive = true
        
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let noConnectionImageView: UIImageView = .init(image: UIImage(named: "icon_no_connection"))
        noConnectionImageView.translatesAutoresizingMaskIntoConstraints = false
        noConnectionView.addSubview(noConnectionImageView)
        
        let noConnectionLabel: UILabel = .init()
        noConnectionLabel.font = .systemFont(ofSize: 12)
        noConnectionLabel.textColor = .gray
        noConnectionLabel.text = "Please check your connection"
        noConnectionLabel.translatesAutoresizingMaskIntoConstraints = false
        noConnectionLabel.numberOfLines = 0
        noConnectionLabel.textAlignment = .center
        noConnectionView.addSubview(noConnectionLabel)
        
        let noConnectionButton: UIButton = RectButton(image: nil, title: "Retry", frame: .zero)
        noConnectionButton.addTarget(self, action: #selector(self.retry), for: .touchUpInside)
        noConnectionView.addSubview(noConnectionButton)
        
        noConnectionView.translatesAutoresizingMaskIntoConstraints = false
        noConnectionView.isHidden = true
        view.addSubview(noConnectionView)
        
        
        noConnectionImageView.centerXAnchor.constraint(equalTo: noConnectionView.centerXAnchor).isActive = true
        noConnectionImageView.topAnchor.constraint(equalTo: noConnectionView.topAnchor).isActive = true
        
        noConnectionLabel.leftAnchor.constraint(equalTo: noConnectionView.leftAnchor).isActive = true
        noConnectionLabel.rightAnchor.constraint(equalTo: noConnectionView.rightAnchor).isActive = true
        noConnectionLabel.topAnchor.constraint(equalTo: noConnectionImageView.bottomAnchor, constant: 4).isActive = true
        
        noConnectionButton.centerXAnchor.constraint(equalTo: noConnectionView.centerXAnchor).isActive = true
        noConnectionButton.topAnchor.constraint(equalTo: noConnectionLabel.bottomAnchor, constant: 8).isActive = true
        noConnectionButton.bottomAnchor.constraint(equalTo: noConnectionView.bottomAnchor).isActive = true
        
        
        noConnectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noConnectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        noConnectionView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        
    }
}
//MARK: - Actions
extension BaseViewController {
    
    func listenForTapsOnViewToDismissKeyboard() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc func retry() {
        
    }
}
