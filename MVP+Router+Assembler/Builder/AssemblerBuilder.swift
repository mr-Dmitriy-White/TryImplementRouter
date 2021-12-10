//
//  AssemblerBuilder.swift
//  MVP+Router+Assembler
//
//  Created by Dima Biliy on 29.10.2021.
//

import UIKit

protocol AssemblerBuilderProtocol {
    func configureMVP(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment : Comment?, router: RouterProtocol) -> UIViewController
}

class ModelBuilder : AssemblerBuilderProtocol {
    
    func configureMVP(router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(comment : Comment?,router: RouterProtocol) -> UIViewController{
        let networkService = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
    
}
