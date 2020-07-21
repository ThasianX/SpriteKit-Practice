// Kevin Li - 8:48 PM - 7/20/20

import UIKit

extension UIColor {

    static var random: UIColor {
        get {
            let possibleColors = [UIColor.popsRed, .popsBlue,
                                  .popsGreen, .popsOrange, .popsYellow, .popsDimGreen]

            let randomIndex = arc4random_uniform(UInt32(possibleColors.count))
            return possibleColors[Int(randomIndex)]
        }
    }

}

extension UIColor {

    static var popsGreen: UIColor {
        get {
            return UIColor.init(red: 6/255.0, green: 177/255.0, blue: 75/255.0, alpha: 1)
        }
    }

    static var popsRed: UIColor {
        get {
            return UIColor.init(red: 235/255.0, green: 37/255.0, blue: 41/255.0, alpha: 1)
        }
    }

    static var popsBlue: UIColor {
        get {
            return UIColor.init(red: 22/255.0, green: 104/255.0, blue: 175/255.0, alpha: 1)
        }
    }

    static var popsDimGreen: UIColor {
        get {
            return UIColor.init(red: 45/255.0, green: 179/255.0, blue: 74/255.0, alpha: 1)
        }
    }

    static var popsYellow: UIColor {
        get {
            return UIColor.init(red: 252/255.0, green: 192/255.0, blue: 49/255.0, alpha: 1)
        }
    }

    static var popsOrange: UIColor {
        get {
            return UIColor.init(red: 240/255.0, green: 122/255.0, blue: 42/255.0, alpha: 1)
        }
    }

    static var popsEditText: UIColor {
        get {
            return UIColor.init(red: 9/255.0, green: 80/255.0, blue: 208/255.0, alpha: 1)
        }
    }

    static var popsInactiveText: UIColor {
        get {
            return UIColor.init(red: 108/255.0, green: 108/255.0, blue: 108/255.0, alpha: 1)
        }
    }
}
