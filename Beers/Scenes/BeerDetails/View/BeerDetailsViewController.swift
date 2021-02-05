

import UIKit

class BeerDetailsViewController: UIViewController {

    // MARK: Properties
    var presenter: ViewToBeerDetailsPresenterProtocol?
    var beerImagesRepo: BeerImagesRepo?
    
    // MARK: Outlets
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
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    func setupViews() {
        
        beerNameLabel.accessibilityIdentifier = "beerNameLabel"
        beerNameLabel.textColor = UIColor.init(named: "beerDetailsLabels.textColor")
        beerNameLabel.setTextAndAccessibilityValue(with: NSLocalizedString("BeerNameLabelText", comment: ""))
        
        beerName.accessibilityIdentifier = "beerName"
        beerName.setTextAndAccessibilityValue(with: "")
        
        tagsLabel.accessibilityIdentifier = "tagsLabel"
        tagsLabel.textColor = UIColor.init(named: "beerDetailsLabels.textColor")
        tagsLabel.setTextAndAccessibilityValue(with: NSLocalizedString("BeerTagsLabelText", comment: ""))
        
        tagsLine.accessibilityIdentifier = "tagsLine"
        tagsLine.setTextAndAccessibilityValue(with: "")
        
        brewedLabel.accessibilityIdentifier = "brewedLabel"
        brewedLabel.textColor = UIColor.init(named: "beerDetailsLabels.textColor")
        brewedLabel.setTextAndAccessibilityValue(with: NSLocalizedString("BrewedLabelText", comment: ""))
        
        brewedText.accessibilityIdentifier = "brewedText"
        brewedText.setTextAndAccessibilityValue(with: "")
        
        descriptionLabel.accessibilityIdentifier = "descriptionLabel"
        descriptionLabel.textColor = UIColor.init(named: "beerDetailsLabels.textColor")
        descriptionLabel.setTextAndAccessibilityValue(with: NSLocalizedString("BeerDescriptionLabelText", comment: ""))
        
        descriptionText.accessibilityIdentifier = "beerDescription"
        descriptionText.setTextAndAccessibilityValue(with: "")
        
        foodPairingLabel.accessibilityIdentifier = "foodPairingLabel"
        foodPairingLabel.textColor = UIColor.init(named: "beerDetailsLabels.textColor")
        foodPairingLabel.setTextAndAccessibilityValue(with: NSLocalizedString("FoodPairingLabelText", comment: ""))
        
        foodPairingText.accessibilityIdentifier = "foodPairingText"
        foodPairingText.setTextAndAccessibilityValue(with: "")
        
        scrollView.accessibilityIdentifier = "beerDetailsScrollView"
        
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
        // TODO
    }
    
    func showBeerDetails(with beer: Beer) {
        
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
        
        self.beerImagesRepo?.fetchImage(from: beer.imageUrl, to: beerImage)
    }
}
