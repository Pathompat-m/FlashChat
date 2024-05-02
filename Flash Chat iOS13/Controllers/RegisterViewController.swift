
import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // MARK: - Button Action

    @IBAction func registerPressed(_ sender: UIButton) {
        // Registers the user with provided email and password.
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription) // Prints error message if registration fails.
                } else {
                    // Successfully registered, navigate to the ChatViewController.
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
}
