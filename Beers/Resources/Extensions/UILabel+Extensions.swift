

import UIKit

extension UILabel {
    func fadeOutNow(){
        self.alpha = 0
    }
    
    func fadeIn(with animationDuration: TimeInterval){
        UIView.animate(withDuration: animationDuration) {
            self.alpha = 1
        }
    }
    
    func setTextAndAccessibilityValue(with value: String) {
        self.text = value
        self.accessibilityValue = value
    }
    
    func setText(with value: String) {
        self.text = value
    }
}
