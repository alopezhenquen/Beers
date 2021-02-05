

import UIKit

extension UITextView {
    
    func setTextAndAccessibilityValue(with value: String) {
        self.text = value
        self.accessibilityValue = value
    }
}
