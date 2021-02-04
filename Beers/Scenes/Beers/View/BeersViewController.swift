//
//  BeersViewController.swift
//  Beers
//
//  Created by Kill3r on 4/2/21.
//  
//

import UIKit

class BeersViewController: UIViewController {

    // MARK: Properties
    var presenter: ViewToBeersPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    init() {
        super.init(nibName: "BeersView", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension BeersViewController: PresenterToBeersViewProtocol {
    //MARK: Methods
}
