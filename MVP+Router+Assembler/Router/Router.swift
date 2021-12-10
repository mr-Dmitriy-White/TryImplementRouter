//
//  Router.swift
//  MVP+Router+Assembler
//
//  Created by Dima Biliy on 29.10.2021.
//

import UIKit

protocol RouterMain {
    var navigationController : UINavigationController? {get set}
    var assembluBuilder : AssemblerBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router : RouterProtocol {
    var navigationController: UINavigationController?
    var assembluBuilder: AssemblerBuilderProtocol?
    
    init(navigationController: UINavigationController,
         assembluBuilder: AssemblerBuilderProtocol) {
        self.navigationController = navigationController
        self.assembluBuilder = assembluBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewContorller = assembluBuilder?.configureMVP(router: self) else {return}
            navigationController.viewControllers = [mainViewContorller]
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailViewContorller = assembluBuilder?.createDetailModule(comment: comment, router: self) else {return}
            navigationController.pushViewController(detailViewContorller, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
