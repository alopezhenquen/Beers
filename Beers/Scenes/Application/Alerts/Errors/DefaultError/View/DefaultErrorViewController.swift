
import UIKit

class DefaultErrorViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var closeButton: UIButton!
    fileprivate var error : Error?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    init() {
        super.init(nibName: "DefaultErrorView", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setupViews() {
        closeButton.setTitle(NSLocalizedString("ErrorButtonTitle", comment: ""), for: .normal)
        titleLabel.text = NSLocalizedString("ErrorTitle", comment: "")
        descriptionText.text = error?.localizedDescription
    }
    
    @IBAction func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configure(with error: Error) -> DefaultErrorViewController {
        self.error = error
        return self
    }
    
    func set(modalPresentationStyle: UIModalPresentationStyle) -> DefaultErrorViewController {
        self.modalPresentationStyle = modalPresentationStyle
        return self
    }
}
