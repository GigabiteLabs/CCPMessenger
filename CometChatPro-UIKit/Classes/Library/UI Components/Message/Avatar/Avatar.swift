//  Avatar.swift
//  CometChatUIKit
//  Created by CometChat Inc. on 20/09/19.
//  Copyright ©  2020 CometChat Inc. All rights reserved.

/* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 Avatar: This component will be the class of UIImageView which is customizable to display Avatar. 
 
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  */


// MARK: - Importing Frameworks.

import Foundation
import  UIKit
import  CometChatPro


/*  ----------------------------------------------------------------------------------------- */

@IBDesignable
@objc public class Avatar: UIImageView {
    
    // MARK: - Declaration of IBInspectable
    
    @IBInspectable var cornerRadius: CGFloat = 0
    
    // MARK: - Initialization of required Methods
    
    override init(image: UIImage?) { super.init(image: image) }  
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = cornerRadius
        self.borderColor = UIColor.lightGray
        self.borderWidth = 0.5
        self.clipsToBounds = true
    }
    
    // MARK: - Public instance methods
    
    /**
     This method used to set the cornerRadius for Avatar class
     - Parameter cornerRadius: This specifies a float value  which sets corner radius.
     - Author: CometChat Team
     - Copyright:  ©  2020 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(cornerRadius : CGFloat) -> Avatar {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        return self
    }
    
    /**
     This method used to set the borderColor for Avatar class
     - Parameter borderColor: This specifies a `UIColor` for border of the Avatar.
     - Author: CometChat Team
     - Copyright:  ©  2020 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(borderColor : UIColor) -> Avatar {
        self.layer.borderColor = borderColor.cgColor
        return self
    }
    
    /**
     This method used to set the backgroundColor for Avatar class
     - Parameter borderColor: This specifies a `UIColor` for border of the Avatar.
     - Author: CometChat Team
     - Copyright:  ©  2020 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(backgroundColor : UIColor) -> Avatar {
        self.backgroundColor = backgroundColor
        return self
    }
    
    /**
     This method used to set the borderWidth for Avatar class
     - Parameter borderWidth: This specifies a `CGFloat` for border width of the Avatar.
     - Author: CometChat Team
     - Copyright:  ©  2020 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(borderWidth : CGFloat) -> Avatar {
        self.layer.borderWidth = borderWidth
        return self
    }
    
    
    /**
     This method used to set the image for Avatar class
     - Parameter image: This specifies a `URL` for  the Avatar.
     - Author: CometChat Team
     - Copyright:  ©  2020 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(image: String) {
        
        let url = URL(string: image)
        self.cf.setImage(with: url, placeholder: UIImage.fromBundle(named: "defaultAvatar.jpg"))
    }
    
    
    @objc public func set(image: String, with name: String) {
        DispatchQueue.main.async { [weak self] in
            let url = URL(string: image)
            let imageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            imageView.setImage(string: name.uppercased())
            self?.cf.setImage(with: url, placeholder: imageView.image)
        }
    }
    
    
    @objc public func set(entity: AppEntity) {
        print("set entity from \(#file)")
        if let user = entity as? User {
            let url = URL(string: user.avatar ?? "")
            let imageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            imageView.setImage(string: user.name?.uppercased())
            self.cf.setImage(with: url, placeholder: imageView.image)
        }
        
        if let group = entity as? Group {
            let url = URL(string: group.icon ?? "")
            let imageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            imageView.setImage(string: group.name?.uppercased())
            self.cf.setImage(with: url, placeholder: imageView.image)
        }
    }
}

/*  ----------------------------------------------------------------------------------------- */
