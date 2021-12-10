//
//  MainPresenter.swift
//  MVP+Router+Assembler
//
//  Created by Dima Biliy on 29.10.2021.
//

import Foundation

protocol MainViewProtocol : AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainPresenterProtocol : AnyObject {
    init(view: MainViewProtocol, networkService : NetworkServiceProtocol, router : RouterProtocol)
    func getComments()
    var comments : [Comment]? {get set}
    func tapOnTheComment(comment: Comment?)
}

class MainPresenter : MainPresenterProtocol {
    
    weak var view : MainViewProtocol?
    let networkService : NetworkServiceProtocol!
    let router : RouterProtocol!
    
    var comments: [Comment]?
    
    required init(view: MainViewProtocol,
                  networkService : NetworkServiceProtocol,
                  router : RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        
        getComments()
    }
    
    func tapOnTheComment(comment: Comment?) {
        router.showDetail(comment: comment)
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error) :
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
}
