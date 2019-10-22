//
//  UIColor+falc.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

extension UIColor {
    
    @nonobjc class var sgBackgroundColor: UIColor {
        return UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    }
    
    /// ViewController 背景色。正常为浅灰，黑暗模式为纯黑色。
    class var falcBackgroundColor: UIColor {
        get {
            #if compiler(>=5.1)
            if #available(iOS 13.0, *) {
                return UIColor.init(dynamicProvider: { (traitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
                    } else {
                        return UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
                    }
                })
            } else {
                return UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
            }
            #else
            return UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
            #endif
        }
    }
    
    /// App 主橙色
    @nonobjc class var sgMainTintColor: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 117.0 / 255.0, blue: 85.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var sgBlackColor: UIColor {
        return UIColor(white: 62.0 / 255.0, alpha: 1.0)
    }
    
    /// cell 标题黑色。正常为黑色，黑暗模式为白色。
    class var falcBlackColor: UIColor {
        get {
            #if compiler(>=5.1)
            if #available(iOS 13.0, *) {
                return UIColor.init(dynamicProvider: { (traitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor(white: 62.0 / 255.0, alpha: 1.0)
                    }
                })
            } else {
                return UIColor(white: 62.0 / 255.0, alpha: 1.0)
            }
            #else
            return UIColor(white: 62.0 / 255.0, alpha: 1.0)
            #endif
        }
    }
    
    @nonobjc class var sgDarkGrayColor: UIColor {
        return UIColor(white: 102.0 / 255.0, alpha: 1.0)
    }
    
    /// cell 详情文本灰色。正常为灰色，黑暗模式为灰色。
    class var falcDarkGrayColor: UIColor {
        get {
            #if compiler(>=5.1)
            if #available(iOS 13.0, *) {
                return UIColor.init(dynamicProvider: { (traitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor(white: 1, alpha: 0.8)
                    } else {
                        return UIColor(white: 102.0 / 255.0, alpha: 1.0)
                    }
                })
            } else {
                return UIColor(white: 102.0 / 255.0, alpha: 1.0)
            }
            #else
            return UIColor(white: 102.0 / 255.0, alpha: 1.0)
            #endif
        }
    }
    
    @nonobjc class var sgLightGrayColor: UIColor {
        return UIColor(white: 180.0 / 255.0, alpha: 1.0)
    }
    
    /// cell 时间文本浅灰色。正常为浅灰色，黑暗模式为浅灰色。
    class var falcLightGrayColor: UIColor {
        get {
            #if compiler(>=5.1)
            if #available(iOS 13.0, *) {
                return UIColor.init(dynamicProvider: { (traitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor(white: 1, alpha: 0.6)
                    } else {
                        return UIColor(white: 180.0 / 255.0, alpha: 1.0)
                    }
                })
            } else {
                return UIColor(white: 180.0 / 255.0, alpha: 1.0)
            }
            #else
            return UIColor(white: 180.0 / 255.0, alpha: 1.0)
            #endif
        }
    }
    
    /// NavigationBar 背景色
    class var falcNaviBackColor: UIColor {
        get {
            #if compiler(>=5.1)
            if #available(iOS 13.0, *) {
                return UIColor.init(dynamicProvider: { (traitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor.black
                    } else {
                        return UIColor(white: 1.0, alpha: 0.68)
                    }
                })
            } else {
                return UIColor(white: 1.0, alpha: 0.68)
            }
            #else
            return UIColor(white: 1.0, alpha: 0.68)
            #endif
        }
    }
    
    /// TabBar 背景色
    class var falcTabBackColor: UIColor {
        get {
            #if compiler(>=5.1)
            if #available(iOS 13.0, *) {
                return UIColor.init(dynamicProvider: { (traitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor(white: 0, alpha: 0.9)
                    } else {
                        return UIColor(white: 1.0, alpha: 0.9)
                    }
                })
            } else {
                return UIColor(white: 1.0, alpha: 0.9)
            }
            #else
            return UIColor(white: 1.0, alpha: 0.9)
            #endif
        }
    }
    
    /// NavigationBar 标题色
    class var falcNaviTitleBlackColor: UIColor {
        get {
            #if compiler(>=5.1)
            if #available(iOS 13.0, *) {
                return UIColor.init(dynamicProvider: { (traitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor(red: 45.0 / 255.0, green: 45.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
                    }
                })
            } else {
                return UIColor(red: 45.0 / 255.0, green: 45.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
            }
            #else
            return UIColor(red: 45.0 / 255.0, green: 45.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
            #endif
        }
    }
    
    /// cell 分割线颜色
    class var falcLineColor: UIColor {
        get {
            #if compiler(>=5.1)
            if #available(iOS 13.0, *) {
                return UIColor.init(dynamicProvider: { (traitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor(red: 61 / 255, green: 61 / 255, blue: 64 / 255, alpha: 1)
                    } else {
                        return UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
                    }
                })
            } else {
                return UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
            }
            #else
            return UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
            #endif
        }
    }
    
    @nonobjc class var greyishBrown: UIColor {
        return UIColor(white: 62.0 / 255.0, alpha: 1.0)
    }
    
}
