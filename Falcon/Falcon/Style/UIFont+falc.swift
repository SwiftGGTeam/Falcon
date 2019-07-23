//
//  UIFont+falc.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Foundation

extension UIFont {
    enum Thickness: String {
        case normal = ""
        case thin = "-Thin"
        case light = "-Light"
        case semibold = "-Semibold"
        case medium = "-Medium"
    }
    
    static func falcFont(size: CGFloat = 16, thick: Thickness = .normal) -> UIFont {
        return UIFont(name: "SFProDisplay\(thick.rawValue)", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class var textStyle: UIFont {
        return UIFont.systemFont(ofSize: 22.0, weight: .bold)
    }
    
    class var sgHeadline: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    }
    
    class var sgCallout: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .medium)
    }
    
    class var sgSubhead: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .medium)
    }
    
    class var sgFootnote: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .medium)
    }
    
    class var sgNaviTitle: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .bold)
    }

    
}
