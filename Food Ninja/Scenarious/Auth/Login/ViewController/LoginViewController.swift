//
//  LoginViewController.swift
//  Food Ninja
//
//  Created by Shaxzod Azamatjonov on 08/09/22.
//

import UIKit

public protocol LoginViewControllerDelegate: AnyObject {
  func loginViewControllerDidPressScheduleAppointment(_ controller: LoginViewController)
}

public class LoginViewController: UIViewController {

    var viewModel: LoginViewModel!
    public weak var delegate: LoginViewControllerDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        print("Login controller")
        view.backgroundColor = .red
    }
}

extension LoginViewController {
  
}
