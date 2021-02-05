//
//  BeerCell.swift
//  Beers
//
//  Created by Kill3r on 4/2/21.
//

import UIKit

class BeerCell: UICollectionViewCell {
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    fileprivate var beerImagesRepo: BeerImagesRepo?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        beerName.textColor = UIColor.init(named: "beerName.textColor")
        self.backgroundColor = UIColor.init(named: "beerCell.backgroundColor")
        self.layer.cornerRadius = 5
        beerImage.contentMode = .scaleAspectFit
    }
    
    func configure(with beer: Beer, using beersImagesRepo: BeerImagesRepo?) {
        beerName?.setText(with: beer.name ?? "")
        self.beerImagesRepo = beersImagesRepo
        cancelImageDownload()
        beersImagesRepo?.fetchImage(from: beer.imageUrl, to: beerImage)
    }
    
    func cancelImageDownload() {
        self.beerImagesRepo?.cancelFetchImage(to: beerImage)
    }

}
