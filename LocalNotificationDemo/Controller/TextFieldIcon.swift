//
//  TextFiledIcon.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/19/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit

@IBDesignable
class TextFieldIcon: UITextField{
    
    
    // ProviQibides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            layer.borderWidth = 2
            layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width:30, height: 25))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    
    }
}
