//
//  AppCoordinator.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import Foundation
import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    ///Function that will instantiate the view controller and start the views
    func start(){
        
        let viewController = ViewController.instantiate(viewModel: FactsListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
