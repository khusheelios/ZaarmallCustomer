
import Foundation
import UIKit



extension UIColor{
    //Colors are computed class properties. To refrence the class, use self
    class var HRBlack:UIColor{
        return self.hexColor(0xFFFFFF, alpha: 1.0)
    }
    
    class var HRBrown:UIColor{
        return self.hexColor(0xD8B865, alpha: 1.0)
    }
    
    class var crust:UIColor{
        return self.hexColor(0xe39448, alpha: 1.0)
    }
    
    //The hexColor method is a class method taking a UInt32 and alpha value and returns a color. See http://bit.ly/HexColorsWeb onhow it works.
    
    class func hexColor(_ hexColorNumber:UInt32, alpha: CGFloat) -> UIColor {
        let red = (hexColorNumber & 0xff0000) >> 16
        let green = (hexColorNumber & 0x00ff00) >> 8
        let blue =  (hexColorNumber & 0x0000ff)
        return self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
}
}
enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}
extension UIColor {

  @nonobjc class var cambioBlue: UIColor {
    return UIColor(red: 85.0 / 255.0, green: 174.0 / 255.0, blue: 251.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var cambioBlack: UIColor {
    return UIColor(white: 0.0, alpha: 1.0)
  }

  @nonobjc class var cambioWhite: UIColor {
    return UIColor(white: 1.0, alpha: 1.0)
  }

  @nonobjc class var cambiobrownGrey: UIColor {
    return UIColor(white: 138.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var cambioGray: UIColor {
    return UIColor(white: 185.0 / 255.0, alpha: 1.0)
  }
    @nonobjc class var veryLightPink: UIColor {
       return UIColor(white: 210.0 / 255.0, alpha: 1.0)
     }
    @nonobjc class var iceBlue: UIColor {
       return UIColor(red: 228.0 / 255.0, green: 245.0 / 255.0, blue: 253.0 / 255.0, alpha: 1.0)
     }
    @nonobjc class var lightGray: UIColor {
      return UIColor(white: 220.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var veryLightGray: UIColor {
       return UIColor(white: 241.0 / 255.0, alpha: 1.0)
     }
    @nonobjc class var cBlue: UIColor {
      return UIColor(red: 85.0 / 255.0, green: 174.0 / 255.0, blue: 251.0 / 255.0, alpha: 1.0)
    }
}

extension UIView {
    func addLine(position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .LINE_POSITION_TOP:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}
