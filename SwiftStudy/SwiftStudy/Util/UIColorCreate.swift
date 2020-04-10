//
//  UIColorCreate.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/10.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

//处理颜色
func HexColor(hex:integer_t) -> UIColor
{
    return HexColorAlpha(hex: hex, alpha: 1)
}

func HexColorAlpha(hex:integer_t, alpha:CGFloat) -> UIColor {
    return UIColor(red: CGFloat((hex >> 16) & 0xff)/255.0, green: CGFloat((hex >> 8) & 0xff)/255.0, blue: CGFloat(hex & 0xff)/255.0, alpha: alpha)
}

public extension UIColor {
    
    /// 十六进制颜色转 UIColor
    convenience init?(_ hex: String) {
        guard let rgbColor = hex.rgbColor else {
            return nil
        }
        self.init(red: rgbColor.red, green: rgbColor.green, blue: rgbColor.blue, alpha: rgbColor.alpha)
    }
    
    /// 0~255 区间的 RGB 值转 UIColor
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
    }
    
    /// UIColor 的十六进制色值
    var hexValue: String? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        guard getRed(&r, green: &g, blue: &b, alpha: &a) else { return nil }
        if a == 1.0 {
            return String(format: "%0.2X%0.2X%0.2X", UInt(r * 255),UInt(g * 255), UInt(b * 255))
        } else {
            return String(format: "%0.2X%0.2X%0.2X%0.2X", UInt(r * 255), UInt(g * 255), UInt(b * 255), UInt(a * 255))
        }
    }
    
    /// UIColor 的 0~255 区间的 RGB 色值
    var rgbValue: String? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        guard getRed(&r, green: &g, blue: &b, alpha: &a) else { return nil }
        
        return "Red:\(UInt(r * 255)), Green:\(UInt(g * 255)), Blue:\(UInt(b * 255)), Alpha:\(UInt(a * 255))"
    }
}

private extension String {
    private var pureHexColor: String {
        return trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
    }
    
    struct RGBColor {
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let alpha: CGFloat
    }
    
    var rgbColor: RGBColor? {
        if pureHexColor.count == 6 {
            return pureHexColor.rgbColorFrom6Hex()
        } else if pureHexColor.count == 8 {
            return pureHexColor.rgbColorFrom8Hex()
        } else {
            return nil
        }
    }
    
    private func rgbColorFrom6Hex() -> RGBColor? {
        guard let rgb = hexToInt32() else { return nil }
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        return RGBColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private func rgbColorFrom8Hex() -> RGBColor? {
        guard let rgb = hexToInt32() else { return nil }
        let red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
        let green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
        let blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
        let alpha = CGFloat(rgb & 0x000000FF) / 255.0
        return RGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private func hexToInt32() -> UInt32? {
        var rgb: UInt32 = 0
        guard Scanner(string: self).scanHexInt32(&rgb) else { return nil }
        return rgb
    }
}


class UIColorCreate: NSObject {
 
}
