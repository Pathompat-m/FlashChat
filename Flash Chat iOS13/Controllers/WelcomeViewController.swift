
import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var titleLabel: CLTypingLabel!
    private let backgroundImageView = UIImageView()
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true // Hides the navigation bar when the view appears.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false // Shows the navigation bar when the view disappears.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = K.appName // Sets the app name as the text of the titleLabel.
        
        // Add background image view
        backgroundImageView.image = UIImage(named: "WelcomeBg.png")
        backgroundImageView.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImageView, at: 0)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        // The following code can be used for typing animation
        
        //        titleLabel.text = ""
        //        var charIndex = 0.0
        //        let titleText = "⚡️FlashChat"
        //        for letter in titleText {
        //            print("-")
        //            print(0.1 * charIndex)
        //            print(letter)
        //            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
        //                self.titleLabel.text?.append(letter)
        //            }
        //            charIndex += 1
        //        }
    }
    

}
