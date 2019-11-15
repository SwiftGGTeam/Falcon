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
    
    class var sgTitle1: UIFont {
        return UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: 22.0, weight: .bold))
    }
    
    class var sgHeadline: UIFont {
        return UIFontMetrics(forTextStyle: .headline).scaledFont(for: .systemFont(ofSize: 16.0, weight: .semibold))
    }
    
    class var sgSubhead: UIFont {
        return UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: .systemFont(ofSize: 13.0, weight: .medium))
    }
    
    class var sgFootnote: UIFont {
        return UIFontMetrics(forTextStyle: .footnote).scaledFont(for: .systemFont(ofSize: 12.0, weight: .medium))
    }
    
    /// Tag label
    class var sgCaption1: UIFont {
        return UIFontMetrics(forTextStyle: .caption1).scaledFont(for: .systemFont(ofSize: 10, weight: .semibold))
    }
    
    class var sgNaviTitle: UIFont {
        return UIFontMetrics(forTextStyle: .title2).scaledFont(for: .systemFont(ofSize: 18.0, weight: .bold))
    }
    
    class var textStyle2: UIFont {
        return UIFontMetrics(forTextStyle: .title2).scaledFont(for: .systemFont(ofSize: 14.0, weight: .medium))
    }

}
