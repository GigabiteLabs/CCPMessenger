//  RightFileMessageBubble.swift
//  CometChatUIKit
//  Created by CometChat Inc. on 20/09/19.
//  Copyright ©  2020 CometChat Inc. All rights reserved.


// MARK: - Importing Frameworks.

import UIKit
import CometChatPro

/*  ----------------------------------------------------------------------------------------- */

class RightFileMessageBubble: CCPMediaMessageCell {

    // MARK: - Declaration of IBOutlets
    
    @IBOutlet weak var tintedView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var receipt: UIImageView!
    @IBOutlet weak var receiptStack: UIStackView!
    
     // MARK: - Declaration of Variables
    var selectionColor: UIColor {
        set {
            let view = UIView()
            view.backgroundColor = newValue
            self.selectedBackgroundView = view
        }
        get {
            return self.selectedBackgroundView?.backgroundColor ?? UIColor.clear
        }
    }
    
    var fileMessage: MediaMessage! {
        set {
            file = newValue
            receiptStack.isHidden = true
            if fileMessage.sentAt == 0 {
               timeStamp.text = NSLocalizedString("SENDING", tableName: nil, bundle: CCPType.bundle, value: "", comment: "")
               name.text = NSLocalizedString("---", tableName: nil, bundle: CCPType.bundle, value: "", comment: "")
               type.text = NSLocalizedString("---", tableName: nil, bundle: CCPType.bundle, value: "", comment: "")
               size.text = NSLocalizedString("---", tableName: nil, bundle: CCPType.bundle, value: "", comment: "")
            }else{
               timeStamp.text = String().setMessageTime(time: fileMessage.sentAt)
                name.text = fileMessage.attachment?.fileName.capitalized
                type.text = fileMessage.attachment?.fileExtension.uppercased()
                if let fileSize = fileMessage.attachment?.fileSize {
                    size.text = Units(bytes: Int64(fileSize)).getReadableUnit()
                }
            }
    
            if fileMessage.readAt > 0 {
               receipt.image = .fromBundle(named: "read")
               timeStamp.text = String().setMessageTime(time: Int(fileMessage?.readAt ?? 0))
            }else if fileMessage.deliveredAt > 0 {
               receipt.image = .fromBundle(named: "delivered")
               timeStamp.text = String().setMessageTime(time: Int(fileMessage?.deliveredAt ?? 0))
            }else if fileMessage.sentAt > 0 {
               receipt.image = .fromBundle(named: "sent")
               timeStamp.text = String().setMessageTime(time: Int(fileMessage?.sentAt ?? 0))
            }else if fileMessage.sentAt == 0 {
                  receipt.image = .fromBundle(named: "wait")
                  timeStamp.text = NSLocalizedString("SENDING", tableName: nil, bundle: CCPType.bundle, value: "", comment: "")
            }
        }
        get {
            return file
        }
    }
    
    // MARK: - Initialization of required Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 13.0, *) {
            selectionColor = .systemBackground
        } else {
            selectionColor = .white
        }
    }

     override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           switch isEditing {
           case true:
               switch selected {
               case true: self.tintedView.isHidden = false
               case false: self.tintedView.isHidden = true
               }
           case false: break
           }
       }
    
}

/*  ----------------------------------------------------------------------------------------- */
