
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // MARK: - Button Action

    @IBAction func loginPressed(_ sender: UIButton) {
        // Attempts to sign in with provided email and password.
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription) // Prints error message if login fails.
                } else {
                    // Successfully logged in, navigate to the ChatViewController.
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
