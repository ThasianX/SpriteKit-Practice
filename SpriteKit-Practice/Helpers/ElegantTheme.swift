// Kevin Li - 4:03 PM - 7/25/20

import UIKit

struct ElegantTheme {

    let name: String
    let color: UIColor

}

extension ElegantTheme {

    static var random: ElegantTheme {
        let possibleColors: [ElegantTheme] = [.brilliantViolet, .craftBrown, .fluorescentPink, .kiwiGreen, .mauvePurple, .orangeYellow, .red, .royalBlue]
        return possibleColors.randomElement()!
    }

}

extension ElegantTheme {

    static let brilliantViolet = ElegantTheme(name: "Brilliant Violet", color: .brilliantViolet)
    static let craftBrown = ElegantTheme(name: "Craft Brown", color: .craftBrown)
    static let fluorescentPink = ElegantTheme(name: "Fluorescent Pink", color: .fluorescentPink)
    static let kiwiGreen = ElegantTheme(name: "Kiwi Green", color: .kiwiGreen)
    static let mauvePurple = ElegantTheme(name: "Mauve Purple", color: .mauvePurple)
    static let orangeYellow = ElegantTheme(name: "Orange Yellow", color: .orangeYellow)
    static let red = ElegantTheme(name: "Red", color: .red)
    static let royalBlue = ElegantTheme(name: "Royal Blue", color: .royalBlue)

}

private extension UIColor {

    static let brilliantViolet = UIColor(red: 69, green: 58, blue: 146)
    static let craftBrown = UIColor(red: 168, green: 136, blue: 99)
    static let fluorescentPink = UIColor(red: 185, green: 22, blue: 77)
    static let kiwiGreen = UIColor(red: 117, green: 142, blue: 41)
    static let mauvePurple = UIColor(red: 148, green: 42, blue: 115)
    static let orangeYellow = UIColor(red: 219, green: 135, blue: 41)
    static let red = UIColor(red: 177, green: 32, blue: 28)
    static let royalBlue = UIColor(red: 24, green: 83, blue: 149)
}

fileprivate extension UIColor {

    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }

}
