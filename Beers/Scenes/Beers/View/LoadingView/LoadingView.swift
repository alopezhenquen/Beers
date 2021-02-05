

import UIKit

class LoadingView: UICollectionReusableView {
    
    // MARK: IBOutlets
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var messageLabel: UILabel!
    
    //MARK: Methods
    
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
