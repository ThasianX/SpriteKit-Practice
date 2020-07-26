// Kevin Li - 4:03 PM - 7/25/20

import UIKit

struct ElegantTheme {

    let name: String
    let color: UIColor

}

extension ElegantTheme {

    static let allThemes: [ElegantTheme] = [
        .antwerpBlue,
        .arcticBlue,
        .bonoboGreen,
        .brilliantViolet,
        .cadiumOrange,
        .fluorescentPink,
        .kiwiGreen,
        .kraftBrown,
        .mauvePurple,
        .orangeYellow,
        .oxideGreen,
        .peachBlossomPink,
        .red,
        .royalBlue,
        .scarletRed,
        .skyBlue,
        .sunflowerYellow,
        .underwaterBlue,
        .wednesdayPink,
    ]

}

extension ElegantTheme {

    static let antwerpBlue = ElegantTheme(name: "Antwerp Blue", color: .antwerpBlue)
    static let arcticBlue = ElegantTheme(name: "Arctic Blue", color: .arcticBlue)
    static let bonoboGreen = ElegantTheme(name: "Bonobo Green", color: .bonoboGreen)
    static let brilliantViolet = ElegantTheme(name: "Brilliant Violet", color: .brilliantViolet)
    static let cadiumOrange = ElegantTheme(name: "Cadium Orange", color: .cadiumOrange)
    static let fluorescentPink = ElegantTheme(name: "Fluorescent Pink", color: .fluorescentPink)
    static let kiwiGreen = ElegantTheme(name: "Kiwi Green", color: .kiwiGreen)
    static let kraftBrown = ElegantTheme(name: "Kraft Brown", color: .kraftBrown)
    static let mauvePurple = ElegantTheme(name: "Mauve Purple", color: .mauvePurple)
    static let orangeYellow = ElegantTheme(name: "Orange Yellow", color: .orangeYellow)
    static let oxideGreen = ElegantTheme(name: "Oxide Green", color: .oxideGreen)
    static let peachBlossomPink = ElegantTheme(name: "Peach Blossom Pink", color: .peachBlossomPink)
    static let red = ElegantTheme(name: "Red", color: .red)
    static let royalBlue = ElegantTheme(name: "Royal Blue", color: .royalBlue)
    static let scarletRed = ElegantTheme(name: "Scarlet Red", color: .scarletRed)
    static let seaweedGreen = ElegantTheme(name: "Seaweed Green", color: .seaweedGreen)
    static let skyBlue = ElegantTheme(name: "Sky Blue", color: .skyBlue)
    static let sunflowerYellow = ElegantTheme(name: "Sunflower Yellow", color: .sunflowerYellow)
    static let underwaterBlue = ElegantTheme(name: "Underwater Blue", color: .underwaterBlue)
    static let wednesdayPink = ElegantTheme(name: "Wednesday Pink", color: .wednesdayPink)

}

private extension UIColor {

    static let antwerpBlue = UIColor(red: 17, green: 110, blue: 176)
    static let arcticBlue = UIColor(red: 149, green: 174, blue: 200)
    static let bonoboGreen = UIColor(red: 24, green: 147, blue: 120)
    static let brilliantViolet = UIColor(red: 69, green: 58, blue: 146)
    static let cadiumOrange = UIColor(red: 208, green: 64, blue: 24)
    static let fluorescentPink = UIColor(red: 185, green: 22, blue: 77)
    static let kiwiGreen = UIColor(red: 117, green: 142, blue: 41)
    static let kraftBrown = UIColor(red: 168, green: 136, blue: 99)
    static let mauvePurple = UIColor(red: 148, green: 42, blue: 115)
    static let orangeYellow = UIColor(red: 219, green: 135, blue: 41)
    static let oxideGreen = UIColor(red: 22, green: 128, blue: 83)
    static let peachBlossomPink = UIColor(red: 177, green: 131, blue: 121)
    static let red = UIColor(red: 177, green: 32, blue: 28)
    static let royalBlue = UIColor(red: 24, green: 83, blue: 149)
    static let scarletRed = UIColor(red: 149, green: 3, blue: 42)
    static let seaweedGreen = UIColor(red: 80, green: 127, blue: 129)
    static let skyBlue = UIColor(red: 72, green: 147, blue: 175)
    static let sunflowerYellow = UIColor(red: 196, green: 151, blue: 51)
    static let underwaterBlue = UIColor(red: 25, green: 142, blue: 152)
    static let wednesdayPink = UIColor(red: 179, green: 102, blue: 159)

}

fileprivate extension UIColor {

    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }

}
