
import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Application Lifecycle Methods

    // Initializes Firebase services upon application launch.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure() // Configures Firebase services.
        
        let db = Firestore.firestore() // Initializes Firestore database.
        print(db) // Prints database reference for debugging purposes.
        
        // Configures IQKeyboardManager for improved keyboard handling.
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.resignOnTouchOutside = true
        
        return true // Indicates successful initialization.
    }

    // MARK: UISceneSession Lifecycle
    
    // Returns the configuration for the new scene session.
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    // Handles the scenario when scene sessions are discarded.
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

