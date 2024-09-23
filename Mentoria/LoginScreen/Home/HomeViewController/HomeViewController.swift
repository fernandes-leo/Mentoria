//
//  HomeViewController.swift
//  LoginScreen
//
//  Created by Leonardo Fernandes on 11/09/24.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(homeView)
        homeView.frame = view.bounds
    }
}
