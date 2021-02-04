//
//  BeersPresenter.swift
//  Beers
//
//  Created by Kill3r on 4/2/21.
//  
//

import Foundation

class BeersPresenter {
    //MARK: Properties
    weak var view: PresenterToBeersViewProtocol?
    var interactor: PresenterToBeersInteractorProtocol?
    var router: PresenterToBeersRouterProtocol?

    //MARK: Methods
    init(view: PresenterToBeersViewProtocol,
         interactor: PresenterToBeersInteractorProtocol,
         router: PresenterToBeersRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension BeersPresenter: ViewToBeersPresenterProtocol {
    //MARK: Methods
    func viewDidLoad() {}
}

extension BeersPresenter: InteractorToBeersPresenterProtocol {
    //MARK: Methods
}
