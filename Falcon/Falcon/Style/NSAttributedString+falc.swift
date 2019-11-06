//
//  NSAttributedString+falc.swift
//  Falcon
//
//  Created by Roc Zhang on 2019/11/6.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

extension NSParagraphStyle {
    
    class var falDescriptionParagraphStyle: NSParagraphStyle {
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 1.35
        return style
    }
    
}
