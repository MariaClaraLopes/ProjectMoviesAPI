import UIKit

final class Fonts {
    static func rubikLight(size: CGFloat = DesignDefaults.numberTwelve) -> UIFont? {
        return UIFont(name: TextModel.fontRubikLight.rawValue, size: size)
    }
    
    static func rubikRegular(size: CGFloat = DesignDefaults.numberFourteen) -> UIFont? {
        return UIFont(name: TextModel.fontRubikRegular.rawValue, size: size)
    }
    
    static func rubikMedium(size: CGFloat = DesignDefaults.numberSixteen) -> UIFont? {
        return UIFont(name: TextModel.fontRubikMedium.rawValue, size: size)
    }
    
    static func rubikBold(size: CGFloat = DesignDefaults.numberFourteen) -> UIFont? {
        return UIFont(name: TextModel.fontRubikBold.rawValue, size: size)
    }
}
