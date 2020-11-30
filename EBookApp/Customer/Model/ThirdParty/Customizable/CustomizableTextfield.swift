//
//  CustomizableTextfield.swift
//  Swiftify
//
//  Created by Frezy Mboumba on 12/17/16.
//  Copyright © 2016 Frezy Mboumba. All rights reserved.
//

import UIKit

@IBDesignable class CustomizableTextfield: UITextField {

  @IBInspectable var padding: CGFloat = 15
       
       // Provides left padding for images
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
                  let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
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
       
       
       override func textRect(forBounds bounds: CGRect) -> CGRect {
           return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
       }

       override func editingRect(forBounds bounds: CGRect) -> CGRect {
           return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
       }
       
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }


}
