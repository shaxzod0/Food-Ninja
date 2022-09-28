//
//  UIFont + Ext.swift
//  Food Ninja
//
//  Created by Shakhzod Azamatjonov on 26/09/22.
//

import UIKit

extension UIFont {
    public enum fontType: String {
        case kFontBlackItalic = "Montserrat-BlackItalic"
        case kFontExtraBoldItalic = "Montserrat-ExtraBoldItalic"
        case kFontBoldItalic = "Montserrat-BoldItalic"
        case kFontSemiBoldItalic = "Montserrat-SemiBoldItalic"
        case kFontMediumItalic = "Montserrat-MediumItalic"
        case kFontItalic = "Montserrat-Italic"
        case kFontLightItalic = "Montserrat-LightItalic"
        case kFontBlack = "Montserrat-Black"
        case kFontExtraLightItalic = "Montserrat-ExtraLightItalic"
        case kFontThinItalic = "Montserrat-ThinItalic"
        case kFontExtraBold = "Montserrat-ExtraBold"
        case kFontBold = "Montserrat-Bold"
        case kFontSemiBold = "Montserrat-SemiBold"
        case kFontMedium = "Montserrat-Medium"
        case kFontRegular = "Montserrat-Regular"
        case kFontLight = "Montserrat-Light"
        case kFontExtraLight = "Montserrat-ExtraLight"
        case kFontThin = "Montserrat-Thin"
    }
    static func setFont(_ type: fontType = .kFontRegular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: type.rawValue, size: size)!
    }
}


