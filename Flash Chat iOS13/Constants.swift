//
//  Constants.swift
//  Flash Chat
//
//  Created by Pathompat Mekbenchapivat on 27/3/2567 BE.
//  Copyright © 2567 BE Angela Yu. All rights reserved.
//

struct K {
    
    // MARK: - Application Constants
    
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    // MARK: - Brand Colors
    
    struct BrandColors {
        static let yellow = "BrandYellow"
        static let lightYellow = "BrandLightYellow"
        static let blue = "BrandBlue"
        static let lightBlue = "BrandLightBlue"
    }
    
    // MARK: - Firestore Constants
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
