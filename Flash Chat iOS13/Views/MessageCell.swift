//
//  MessageCell.swift
//  Flash Chat 
//
//  Created by Pathompat Mekbenchapivat on 27/3/2567 BE.
//

import UIKit

class MessageCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Configure the appearance of the message bubble.
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    // MARK: - Selection Handling
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Additional configuration can be added for selected state if needed.
    }
    
}
