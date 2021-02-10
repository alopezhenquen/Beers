
import UIKit

class DefaultErrorAlert : ErrorAlert {
    fileprivate var rootView: UIViewController
    
    init(rootView: UIViewController) {
        self.rootView = rootView
    }
    
    func showError(with error: Error) {
        let errorView = DefaultErrorViewController
                            .init()
                            .configure(with: error)
                            .set(modalPresentationStyle: .overFullScreen)
        rootView.navigationController?.present(errorView, animated: true, completion: nil)
    }
}

