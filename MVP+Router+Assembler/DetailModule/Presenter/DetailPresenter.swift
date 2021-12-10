//
//  DetailPresenter.swift
//  MVP+Router+Assembler
//
//  Created by Dima Biliy on 29.10.2021.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment : Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject  {
    init (view: DetailViewProtocol ,
          networkService : NetworkServiceProtocol,
          router : RouterProtocol,
          comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter : DetailViewPresenterProtocol {
    weak var view : DetailViewProtocol?
    let networkService: NetworkServiceProtocol?
    var router : RouterProtocol?
    var comment: Comment?
    
    required init(view: DetailViewProtocol,
                  networkService: NetworkServiceProtocol,
                  router : RouterProtocol,
                  comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.comment = comment
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    func tap() {
        router?.popToRoot()
    }
}
