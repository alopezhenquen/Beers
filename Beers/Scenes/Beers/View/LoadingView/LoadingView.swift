//
//  LoadingView.swift
//  MarvelCharactersExample
//
//  Created by Kill3r on 24/1/21.
//

import UIKit

class LoadingView: UICollectionReusableView {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layerWillDraw(_ layer: CALayer) {
        messageLabel.fadeOutNow()
    }
    
    func showMessage(message: String) {
        loadingIndicator.isHidden = true
        messageLabel.text = message
        messageLabel.fadeIn(with: 0.25)
    }
    
    func startIndicator(){
        messageLabel.fadeOutNow()
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func stopIndicator(){
        loadingIndicator.stopAnimating()
    }
    
}
