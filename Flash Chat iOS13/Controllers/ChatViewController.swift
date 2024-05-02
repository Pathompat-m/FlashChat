
import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    // MARK: - Properties

    let db = Firestore.firestore() // Firestore database reference.
    var messages: [Message] = [] // Array to store chat messages.
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self // Sets the data source for the table view.
        title = K.appName // Sets the title of the view controller.
        navigationItem.hidesBackButton = true // Hides the back button in the navigation bar.
        
        // Registers the custom message cell nib for the table view.
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages() // Loads chat messages from Firestore.

    }
    
    // MARK: - Data Loading
    
    func loadMessages() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (QuerySnapshot, error) in
            self.messages = [] // Clears existing messages array.
            
            if let e = error {
                print("There was an issue retrieving data from Firestore \(e)")
            } else {
                if let snapshotDocuments = QuerySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage) // Appends new message to the array.
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData() // Reloads table view data.
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true) // Scrolls to the last message.
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Button Actions

    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                } else {
                    print("Successfully saved data.")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = "" // Clears message text field after sending.
                    }
                }
            }
        }
    }
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        // Logs out the current user and navigates back to the login screen.
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

// MARK: - Table View Data Source

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count // Returns the number of messages in the array.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]// Retrieves message for the current index path.
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
            as! MessageCell // Dequeues a reusable message cell.
        cell.label.text = message.body // Sets the message body text.
        
        // This is a message from the current user.
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightBlue)
            cell.label.textColor = UIColor(named: K.BrandColors.blue)
            cell.label.font = UIFont.boldSystemFont(ofSize: cell.label.font.pointSize)
        } else {
            // This is a message from another sender.
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightYellow)
            cell.label.textColor = UIColor(named: K.BrandColors.yellow)
            cell.label.font = UIFont.boldSystemFont(ofSize: cell.label.font.pointSize)
        }

        return cell // Returns the configured cell.
    }
}

