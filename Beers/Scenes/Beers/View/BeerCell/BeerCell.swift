

import UIKit

class BeerCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    
    // MARK: Properties
    fileprivate var beerImagesRepo: BeerImagesRepo?

    //MARK: Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        beerName.textColor = UIColor.init(named: "beerName.textColor")
        beerName.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        
        beerImage.contentMode = .scaleAspectFit
        
        self.backgroundColor = UIColor.init(named: "beerCell.backgroundColor")
        self.layer.cornerRadius = 5
    }
    
    func configure(with beer: Beer, using beersImagesRepo: BeerImagesRepo?) {
        self.beerImagesRepo = beersImagesRepo
        beerName?.setText(with: beer.name ?? NSLocalizedString("NoNameAvailableText", comment: ""))
        cancelImageDownload() // Cancel Prefetch.
        beersImagesRepo?.fetchImage(from: beer.imageUrl, to: beerImage)
    }
    
    func cancelImageDownload() {
        self.beerImagesRepo?.cancelFetchImage(to: beerImage)
    }

}
