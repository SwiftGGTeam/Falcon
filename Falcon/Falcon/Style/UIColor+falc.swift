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
    
    /// 标题颜色
    static var falcListTitleColor: UIColor {
        get {
            return UIColor(red: 62 / 255, green: 62 / 255, blue: 62 / 255, alpha: 1)
        }
    }
    
    static var falcListDescColor: UIColor {
        get {
            return UIColor(red: 102 / 255, green: 102 / 255, blue: 102 / 255, alpha: 1)
        }
    }
    
    static var falcSwiftOrangeColor: UIColor {
        get {
            return UIColor(red: 245 / 255, green: 117 / 255, blue: 85 / 255, alpha: 1)
        }
    }
}
