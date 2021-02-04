//
//  BeersProtocols.swift
//  Beers
//
//  Created by Kill3r on 4/2/21.
//  
//

import Foundation

//MARK: Implemented by View (Presenter -> View)
protocol PresenterToBeersViewProtocol: class {
    //MARK: Methods
}

//MARK: Implemented by Presenter (View -> Presenter)
protocol ViewToBeersPresenterProtocol: class {
    //MARK: Methods
    func viewDidLoad()
}

//MARK: Implemented by Presenter (Interactor -> Presenter)
protocol InteractorToBeersPresenterProtocol: class {
    //MARK: Methods
}

//MARK: Implemented by Interactor (Presenter -> Interactor)
protocol PresenterToBeersInteractorProtocol: class {
    //MARK: Methods
}

//MARK: Implemented by Router (Presenter -> Router)
protocol PresenterToBeersRouterProtocol: class {
    //MARK: Methods
}
