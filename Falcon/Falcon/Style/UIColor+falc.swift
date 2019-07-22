//
//  UIColor+falc.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

extension UIColor {
    /// 背景色
    static var falcBackgroundColor: UIColor {
        get {
            return UIColor(red: 220 / 255, green: 220 / 255, blue: 220 / 255, alpha: 1)
        }
    }
    
    @nonobjc class var sgMainTintColor: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 117.0 / 255.0, blue: 85.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var sgBlackColor: UIColor {
        return UIColor(white: 62.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var sgDarkGrayColor: UIColor {
        return UIColor(white: 102.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var sgLightGrayColor: UIColor {
        return UIColor(white: 180.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var sgNaviColor: UIColor {
        return UIColor(white: 1.0, alpha: 0.68)
    }
    
    @nonobjc class var sgTabBarColor: UIColor {
        return UIColor(white: 1.0, alpha: 0.9)
    }
    
    @nonobjc class var sgNaviTitleBlackColor: UIColor {
        return UIColor(red: 45.0 / 255.0, green: 45.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var sgBackgroundColor: UIColor {
        return UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    }

}
