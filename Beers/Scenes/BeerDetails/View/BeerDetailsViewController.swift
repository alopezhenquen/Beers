//
//  BeerDetailsViewController.swift
//  Beers
//
//  Created by Kill3r on 5/2/21.
//  
//

import UIKit
import FaveButton

class BeerDetailsViewController: UIViewController {

    // MARK: Properties
    var presenter: ViewToBeerDetailsPresenterProtocol?
    var beerImagesRepo: BeerImagesRepo?
    var isFavorite = false
    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var tagsLine: UILabel!
    @IBOutlet weak var brewedLabel: UILabel!
    @IBOutlet weak var brewedText: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var foodPairingLabel: UILabel!
    @IBOutlet weak var foodPairingText: UITextView!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var favoritesButton: FaveButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    func setupViews(){
        // TODO Setup Views.
        beerNameLabel.accessibilityIdentifier = "beerNameLabel"
        beerNameLabel.setTextAndAccessibilityValue(with: NSLocalizedString("BeerNameLabelText", comment: ""))
        
        beerName.accessibilityIdentifier = "beerName"
        beerName.setTextAndAccessibilityValue(with: "")
        
        tagsLabel.accessibilityIdentifier = "tagsLabel"
        tagsLabel.setTextAndAccessibilityValue(with: NSLocalizedString("BeerTagsLabelText", comment: ""))
        
        tagsLine.accessibilityIdentifier = "tagsLine"
        tagsLine.setTextAndAccessibilityValue(with: "")
        
        brewedLabel.accessibilityIdentifier = "brewedLabel"
        brewedLabel.setTextAndAccessibilityValue(with: NSLocalizedString("BrewedLabelText", comment: ""))
        
        brewedText.accessibilityIdentifier = "brewedText"
        brewedText.setTextAndAccessibilityValue(with: "")
        
        descriptionLabel.accessibilityIdentifier = "descriptionLabel"
        descriptionLabel.setTextAndAccessibilityValue(with: NSLocalizedString("BeerDescriptionLabelText", comment: ""))
        
        descriptionText.accessibilityIdentifier = "beerDescription"
        descriptionText.setTextAndAccessibilityValue(with: "")
        
        foodPairingLabel.accessibilityIdentifier = "foodPairingLabel"
        foodPairingLabel.setTextAndAccessibilityValue(with: NSLocalizedString("FoodPairingLabelText", comment: ""))
        
        foodPairingText.accessibilityIdentifier = "foodPairingText"
        foodPairingText.setTextAndAccessibilityValue(with: "")
        
        scrollView.accessibilityIdentifier = "beerDetailsScrollView"
        favoritesLabel.accessibilityIdentifier = "favoritesLabel"
        favoritesButton.accessibilityIdentifier = "favoritesButton"
        beerImage.accessibilityIdentifier = "beerImage"
        beerImage.contentMode = .scaleAspectFit
        
        self.title = NSLocalizedString("DetailsTitle", comment: "")
        self.navigationItem.backButtonTitle = ""
    }

    init() {
        super.init(nibName: "BeerDetailsView", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension BeerDetailsViewController: PresenterToBeerDetailsViewProtocol {
    
    //MARK: Methods
    
    func showError(error: Error) {
        self.showErrorAlert(with: error)
    }
    
    func showBeerDetails(beer: Beer, isFavorite: Bool) {
        
        // Setup Labels
        if let _name = beer.name, !_name.isEmpty {
            beerName.setTextAndAccessibilityValue(with: _name)
        } else {
            beerName.setTextAndAccessibilityValue(with: NSLocalizedString("NoNameAvailableText", comment: ""))
        }
        
        if let _tagsLine = beer.tagline, !_tagsLine.isEmpty {
            tagsLine.setTextAndAccessibilityValue(with: _tagsLine)
        } else {
            tagsLine.setTextAndAccessibilityValue(with: NSLocalizedString("NoTagAvailableText", comment: ""))
        }
        
        if let _brewed = beer.firstBrewed, !_brewed.isEmpty {
            brewedText.setTextAndAccessibilityValue(with: _brewed)
        } else {
            brewedText.setTextAndAccessibilityValue(with: NSLocalizedString("NoBrewedAvailableText", comment: ""))
        }
        
        if let _description = beer.description, !_description.isEmpty {
            descriptionText.setTextAndAccessibilityValue(with: _description)
        } else {
            descriptionText.setTextAndAccessibilityValue(with: NSLocalizedString("NoDescriptionAvailableText", comment: ""))
        }
        
        if let _foodParing = beer.foodPairing, !_foodParing.isEmpty {
            var _foodParingText = ""
            for item in _foodParing {
                _foodParingText += "\u{2022} \(item).\n"
            }
            foodPairingText.setTextAndAccessibilityValue(with: _foodParingText)
        } else {
            foodPairingText.setTextAndAccessibilityValue(with: NSLocalizedString("NoFoodPairingAvailableText", comment: ""))
        }
        
        // Setup Image
        self.beerImagesRepo?.fetchImage(from: beer.imageUrl, to: beerImage)
        
        // Setup Favorites Button
//        self.isFavorite = isFavorite
//        if isFavorite {
//            addToFavoritesLabel.setTextAndAccessibilityValue(with: NSLocalizedString("RemoveFromFavoritesLabel", comment: ""))
//            addToFavoritesButton.isSelected = true
//        } else {
//            addToFavoritesLabel.setTextAndAccessibilityValue(with: NSLocalizedString("AddToFavoritesLabel", comment: ""))
//            addToFavoritesButton.isSelected = false
//        }
    }
}
