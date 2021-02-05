

import Foundation

//MARK: Implemented by View (Presenter -> View)
protocol PresenterToBeerDetailsViewProtocol: class {
    //MARK: Methods
    func showError(error: Error)
    func showBeerDetails(with beer: Beer)
}

//MARK: Implemented by Presenter (View -> Presenter)
protocol ViewToBeerDetailsPresenterProtocol: class {
    //MARK: Methods
    func viewWillAppear()
}

//MARK: Implemented by Presenter (Interactor -> Presenter)
protocol InteractorToBeerDetailsPresenterProtocol: class {
    //MARK: Methods
}

//MARK: Implemented by Interactor (Presenter -> Interactor)
protocol PresenterToBeerDetailsInteractorProtocol: class {
    //MARK: Methods
}

//MARK: Implemented by Router (Presenter -> Router)
protocol PresenterToBeerDetailsRouterProtocol: class {
    //MARK: Methods
}
